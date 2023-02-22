import 'package:flutter/material.dart';

import '../models/Sympthom.dart';

class CheckBoxCustom extends StatefulWidget {
  bool checkedValue;
  String label;
  String imageUrl;
  CheckBoxCustom(
      {required this.label,
      required this.checkedValue,
      required this.imageUrl,
      super.key});

  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}

class _CheckBoxCustomState extends State<CheckBoxCustom>{
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: const CircleBorder(),
      title: Text(
        "${widget.label}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      value: widget.checkedValue,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      secondary: Image(
        image: AssetImage("${widget.imageUrl}"),
      ),
      onChanged: (newValue) {
        setState(() {
          widget.checkedValue = newValue!;
        });
      },
    );
  }
}
