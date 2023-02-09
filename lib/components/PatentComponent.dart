// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class PatentComponent extends StatelessWidget {
  const PatentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 40,
        child: Column(
          
          children: [
            Flexible(
              child: Text("Patents",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Text('200')
          ],
        ));
  }
}
