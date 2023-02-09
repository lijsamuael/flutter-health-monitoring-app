import 'package:flutter/material.dart';

class TimeSlot extends StatelessWidget {
  TimeSlot({super.key, required String time}) {
    this.time = time;
  }

  String time = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(2)),
      child: Text(time),
    );
  }
}
