import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:tflite/tflite_flutter';

import '../widgets/CheckBoxCustom.dart';
import '../models/Sympthom.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  State<DiseasePrediction> createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  bool checkedValue = false;
  // @override
  // void initState() {
  //   super.initState();
  //   loadModel();
  // }

  var checkdeValues = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<int> sympthomValues = <int>[
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  var sympthoms = <String>[
    'itching',
    'skin_rash',
    'continuous_sneezing',
    'chills',
    'joint_pain',
    'stomach_pain',
    'acidity',
    'vomiting',
    'burning_micturition',
    'fatigue',
    'mood_swings',
    'weight_loss',
    'restlessness',
    'lethargy',
    'cough',
    'high_fever',
    'breathlessness',
    'sweating',
    'indigestion',
    'headache',
    'yellowish_skin',
    'dark_urine',
    'nausea',
    'loss_of_appetite',
    'back_pain',
    'constipation',
    'abdominal_pain',
    'diarrhoea',
    'mild_fever',
    'yellowing_of_eyes',
    'swelled_lymph_nodes',
    'malaise',
    'blurred_and_distorted_vision',
    'phlegm',
    'chest_pain',
    'fast_heart_rate',
    'neck_pain',
    'dizziness',
    'obesity',
    'excessive_hunger',
    'muscle_weakness',
    'stiff_neck',
    'swelling_joints',
    'loss_of_balance',
    'depression',
    'irritability',
    'muscle_pain',
    'red_spots_over_body',
    'family_history'
  ];

  late List<Double> doubleList;

  var predictedDisease = "Results will appear here...";

  Future loadModel() async {
    try {
      final interpreter = await Interpreter.fromAsset('models/model.tflite');
      var input = doubleList;
      var output = List.filled(1, 0).reshape([1, 1]);
      interpreter.run(input, output);
      setState(() {
        predictedDisease = output[0][0].toString();
      });
      print(output[0][0].toString());
    } on Exception catch (e) {
      print(e);
      setState(() {
        predictedDisease = "...Prediction is taking long";
      });
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
              width: MediaQuery.of(context).size.width*1,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${predictedDisease}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(234, 51, 71, 204),
                      ),
                      onPressed: () {
                        List<double> doubleList =
                            sympthomValues.map((i) => i.toDouble()).toList();
                  
                        int toInt(bool val) => val ? 1 : 0;
                        for (int i = 0; i < 49; i++) {
                          sympthomValues[i] = toInt(checkdeValues[i]);
                        }
                        print(checkdeValues);
                        print(sympthomValues);
                        loadModel();
                      },
                      child: const Text('Predect Disease'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[0]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[0],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[0] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[1]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[1],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[1] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[2]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[2],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[2] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[3]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[3],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[3] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[4]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[4],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[4] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[5]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[5],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[5] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[6]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[6],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[6] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[7]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[7],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[7] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[8]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[8],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[8] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[9]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[9],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[9] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[10]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[10],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[10] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[11]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[11],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[11] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[12]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[12],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[12] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[13]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[13],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[13] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[14]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[14],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[14] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[15]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[15],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[15] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[16]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[16],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[16] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[17]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[17],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[17] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[18]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[18],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[18] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[19]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[19],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[19] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[20]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[20],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[20] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[21]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[21],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[21] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[22]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[22],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[22] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[23]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[23],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[23] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[24]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[24],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[24] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[25]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[25],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[25] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[26]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[26],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[26] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[27]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[27],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[27] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[28]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[28],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[28] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[29]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[29],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[29] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[30]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[30],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[30] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[31]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[31],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[31] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[32]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[32],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[32] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[33]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[33],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[33] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[34]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[34],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[34] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[35]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[35],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[35] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[36]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[36],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[36] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[37]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[37],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[37] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[38]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[38],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[38] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[39]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[39],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[39] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[40]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[40],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[40] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[41]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[41],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[41] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[42]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[42],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[42] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[43]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[43],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[43] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[44]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[44],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[44] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[45]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[45],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[45] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[46]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[46],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[46] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[47]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[47],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[47] = newValue!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        checkboxShape: const CircleBorder(),
                        title: Text(
                          "${sympthoms[48]}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: checkdeValues[48],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        // secondary: const Image(
                        //   image:
                        //       AssetImage("assets/images/symthoms/skinrash.jpg"),
                        // ),
                        onChanged: (newValue) {
                          setState(() {
                            checkdeValues[48] = newValue!;
                          });
                        },
                      ),

                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
                      // CheckBoxCustom(
                      //   label: "Skin rash",
                      //   checkedValue: checkedValue,
                      //   imageUrl: "assets/images/symthoms/skinrash.jpg",
                      // ),
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
