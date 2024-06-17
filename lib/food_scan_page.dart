import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

class ScanFoodPage extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const ScanFoodPage({Key? key, this.cameras}) : super(key: key);

  @override
  _ScanFoodPageState createState() => _ScanFoodPageState();
}

class _ScanFoodPageState extends State<ScanFoodPage> {
  CameraController? cameraController;
  Interpreter? interpreter;
  List<String>? labels;
  CameraImage? cameraImage;
  bool isDetecting = false;
  String? detectedFood;
  int? calorieContent;

  final Map<String, int> foodCalories = {
    'aloo gobi': 150,
    'adhirasam': 300,
    'aloo tikki': 200,
    'biryani': 400,
    'butter chicken': 350,
    'bhindi masala': 100,
    'bhatura': 250,
    'basundi': 180,
    'chana masala': 150,
    'chapati': 70,
    'chicken tikka': 220,
    'cham cham': 180,
    'daal makhni': 300,
    'gajar ka halwa': 250,
    'ghevar': 400,
    'gulab jamun': 150,
    'jalebi': 200,
    'kachori': 300,
    'kadhai paneer': 250,
    'kadhi pakoda': 200,
    'kuzi paniyaram': 150,
    'lassi': 150,
    'litti choka': 250,
    'missi roti': 100,
    'malpua': 250,
    'kalakand': 180,
    'naan': 250,
    'palak paneer': 200,
    'poha': 100,
    'paneer butter masala': 350,
    'rabri': 300,
    'ras malai': 250,
    'rasgulla': 150,
    'sandesh': 100,
    'unni apam': 150,
    'sheer korma': 350,
    'soan papdi': 200,
  };

  @override
  void initState() {
    super.initState();
    loadModel();
    loadCamera();
  }

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset('model_unquant.tflite');
    labels = [
      'aloo gobi', 'adhirasam', 'aloo tikki', 'biryani', 'butter chicken', 'bhindi masala', 'bhatura', 'basundi', 'chana masala', 'chapati', 'chicken tikka', 'cham cham', 'daal makhni', 'gajar ka halwa', 'ghevar', 'gulab jamun', 'jalebi', 'kachori', 'kadhai paneer', 'kadhi pakoda', 'kuzi paniyaram', 'lassi', 'litti choka', 'missi roti', 'malpua', 'kalakand', 'naan', 'palak paneer', 'poha', 'paneer butter masala', 'rabri', 'ras malai', 'rasgulla', 'sandesh', 'unni apam', 'sheer korma', 'soan papdi'
    ];
  }

  void loadCamera() {
    if (widget.cameras != null && widget.cameras!.isNotEmpty) {
      cameraController = CameraController(widget.cameras![0], ResolutionPreset.high);
      cameraController!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          cameraController!.startImageStream((image) {
            if (!isDetecting) {
              isDetecting = true;
              cameraImage = image;
              runModel();
            }
          });
        });
      });
    }
  }

  Future<void> runModel() async {
    if (cameraImage != null && interpreter != null) {
      var input = imageToByteListUint8(cameraImage!, 224, 224);
      var output = List.filled(1 * labels!.length, 0).reshape([1, labels!.length]);
      interpreter!.run(input, output);

      var maxIndex = output[0].indexOf(output[0].reduce((a, b) => a > b ? a : b));

      setState(() {
        detectedFood = labels![maxIndex];
        calorieContent = foodCalories[detectedFood!];
        isDetecting = false;
      });
    }
  }

  Uint8List imageToByteListUint8(CameraImage image, int inputWidth, int inputHeight) {
    var imgData = convertCameraImage(image);
    img.Image resizedImage = img.copyResize(imgData, width: inputWidth, height: inputHeight);
    var convertedBytes = Float32List(inputWidth * inputHeight * 3);
    var buffer = Float32List.view(convertedBytes.buffer);

    int pixelIndex = 0;
    for (int i = 0; i < inputHeight; i++) {
      for (int j = 0; j < inputWidth; j++) {
        var pixel = resizedImage.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - 127.5) / 127.5;
        buffer[pixelIndex++] = (img.getGreen(pixel) - 127.5) / 127.5;
        buffer[pixelIndex++] = (img.getBlue(pixel) - 127.5) / 127.5;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  img.Image convertCameraImage(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final int uvRowStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel!;

    var imgData = img.Image(width, height);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int uvOffset = uvPixelStride * (x ~/ 2) + uvRowStride * (y ~/ 2);
        final int index = y * width + x;

        final yp = image.planes[0].bytes[index];
        final up = image.planes[1].bytes[uvOffset];
        final vp = image.planes[2].bytes[uvOffset];
        final r = (yp + vp * 1.402).clamp(0, 255).toInt();
        final g = (yp - up * 0.344136 - vp * 0.714136).clamp(0, 255).toInt();
        final b = (yp + up * 1.772).clamp(0, 255).toInt();

        imgData.setPixel(x, y, img.getColor(r, g, b));
      }
    }
    return imgData;
  }

  @override
  void dispose() {
    cameraController?.dispose();
    interpreter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Food Item'),
      ),
      body: Column(
        children: [
          if (cameraController != null && cameraController!.value.isInitialized)
            Expanded(
              child: AspectRatio(
                aspectRatio: cameraController!.value.aspectRatio,
                child: CameraPreview(cameraController!),
              ),
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Trigger the capture functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF82ACBA), // Button color
            ),
            child: Text(
              'Capture Food',
              style: TextStyle(color: Colors.white), // Text color
            ),
          ),
          if (detectedFood != null && calorieContent != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '$detectedFood: $calorieContent kcal',
                style: TextStyle(fontSize: 24),
              ),
            ),
        ],
      ),
    );
  }
}
