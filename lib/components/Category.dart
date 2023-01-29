import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category(String name, {super.key}) {
    this.name = name;
  }
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      // padding: const EdgeInsets.all(10),
      width: 170,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey)
          ]),
      child: Column(
        children: [
          const Icon(
            Icons.health_and_safety,
            size: 50,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: "SpaceMono"),
            ),
          )
        ],
      ),
    );
  }
}
