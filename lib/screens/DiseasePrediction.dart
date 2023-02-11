import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tflite/tflite.dart';

import '../widgets/CheckBoxCustom.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  State<DiseasePrediction> createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  bool checkedValue = false;

  Future loadModel() async {
    Tflite.close();
    try {
      String res;
      res = (await Tflite.loadModel(
        model: "assets/models/model/model.tflite",
        labels: "assets/models/label/labels.txt",
        // useGpuDelegate: true,
      ))!;
      print("..................................model loading status $res");
    } on PlatformException {
      print('---------------------------------------Failed to load model.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          // elevation: 0,
          title: const Text(
            "Disease prediction",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[200],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Results will appear here $loadModel.res",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(234, 51, 71, 204),
                    ),
                    onPressed: () {
                      loadModel();
                    },
                    child: const Text('Predect Disease'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                      CheckBoxCustom(
                        label: "Skin rash",
                        checkedValue: checkedValue,
                        imageUrl: "assets/images/symthoms/skinrash.jpg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
