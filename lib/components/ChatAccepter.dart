import 'package:flutter/material.dart';

class ChatReceiver extends StatelessWidget {
  ChatReceiver({super.key, required this.message});
  String message;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(157, 38, 126, 189),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          )),
      child: Text(
          message),
    );
  }
}