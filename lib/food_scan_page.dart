import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_calorie_recognition_app/main.dart';
import 'package:tflite_v2/tflite_v2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  Map<String, String> foodCalories = {
    '0 aloo gobi': '120 kcal',
    '1 adhirasam': '320 kcal',
    '2 aloo tikki': '160 kcal',
    '3 biryani': '350 kcal',
    '4 butter chicken': '460 kcal',
    '5 bhindi masala': '110 kcal',
    '6 bhatura': '180 kcal',
    '7 basundi': '120 kcal',
    '8 chana masala': '150 kcal',
    '9 chapati': '70 kcal',
    '10 chicken tikka': '260 kcal',
    '11 cham cham': '180 kcal',
    '12 daal makhni': '320 kcal',
    '13 gajar ka halwa': '220 kcal',
    '14 ghevar': '200 kcal',
    '15 gulab jamun': '150 kcal',
    '16 jalebi': '230 kcal',
    '17 kachori': '210 kcal',
    '18 kadhai paneer': '260 kcal',
    '19 kadhi pakoda': '180 kcal',
    '20 kuzi paniyaram': '170 kcal',
    '21 lassi': '120 kcal',
    '22 litti choka': '220 kcal',
    '23 missi roti': '130 kcal',
    '24 malpua': '250 kcal',
    '25 kalakand': '180 kcal',
    '26 naan': '200 kcal',
    '27 palak paneer': '230 kcal',
    '28 poha': '180 kcal',
    '29 paneer butter masala': '350 kcal',
    '30 rabri': '210 kcal',
    '31 ras malai': '180 kcal',
    '32 rasgulla': '150 kcal',
    '33 sandesh': '160 kcal',
    '34 unni apam': '190 kcal',
    '35 sheer korma': '200 kcal',
    '36 soan papdi': '120 kcal',
  };


  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
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

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          String foodItem = element['label'];
          String calories = foodCalories[foodItem] ?? 'Calorie info not available';
          output = '$foodItem: $calories';
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Calorie Detection')),
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
        ),
      ]),
    );
  }
}
