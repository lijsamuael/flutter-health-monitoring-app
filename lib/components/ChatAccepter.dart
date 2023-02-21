import 'package:flutter/material.dart';
import 'package:health/models/Message.dart';

class ChatAccepter extends StatelessWidget {
  ChatAccepter({super.key, required this.message});
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
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
          message.message)
      ),

    );
  }
}