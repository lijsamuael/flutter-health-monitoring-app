import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.label, super.key, this.icon,});
  late String label;
  late IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(), suffixIcon: Icon(icon)),   
            ),
          ),
        ],
      ),
    );
  }
}
