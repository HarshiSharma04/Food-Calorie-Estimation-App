import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras[0], ResolutionPreset.high);
      cameraController!.initialize().then((value) {
        if (!mounted) {
          return;
        } else {
          setState(() {
            cameraController!.startImageStream((imageStream) {
              cameraImage = imageStream;
              runModel();
            });
          });
        }
      });
    }
  }


  runModel() async {
    if (cameraImage != null) {
      var interpreter = await Interpreter.fromAsset('model.tflite');
      var input = cameraImage!.planes.map((plane) {
        return plane.bytes;
      }).toList();
      var output = List.filled(1 * 2, 0).reshape([1, 2]); // Assuming output shape is [1, 2]

      interpreter.run(input, output);

      setState(() {
        this.output = output.toString(); // Update output based on your model's output
      });
    }
  }

  loadModel() async {
    // No need to load the model here as it's loaded in runModel()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Emotion Detection App')),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
              aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),
            ),
          ),
        ),
        Text(
          output,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
    );
  }
}
