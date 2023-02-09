import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.label, super.key,this.icon});
  late String label;
  late IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( this.label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),
              suffixIcon: Icon(this.icon)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
