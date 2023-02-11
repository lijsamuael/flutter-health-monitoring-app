import 'package:flutter/material.dart';

class CheckBoxCustom extends StatefulWidget {
  bool checkedValue;
  String label;
  CheckBoxCustom({required this.label, required this.checkedValue, super.key});
  @override
  State<CheckBoxCustom> createState() => _CheckBoxCustomState();
}
class _CheckBoxCustomState extends State<CheckBoxCustom> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: const CircleBorder(),
      title: Text("${widget.label}"),
      value: widget.checkedValue,
      onChanged: (newValue) {
        setState(() {
          widget.checkedValue = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
