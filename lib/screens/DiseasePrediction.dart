import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CheckBoxCustom.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  State<DiseasePrediction> createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            // elevation: 0,
            title: const Text(
              "Appointment",
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
          body: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              ),
              CheckBoxCustom(
                label: "abebeb",
                checkedValue: checkedValue,
              )
            ],
          )),
    );
  }
}
