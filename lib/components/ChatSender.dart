
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:health/models/Message.dart';

class ChatSender extends StatelessWidget {
 ChatSender({super.key, required this.message});
  Message message;
  @override
  Widget build(BuildContext context){ 
    return Align(
      child: Container(
        child:  Text(message.message),
        margin: const EdgeInsets.only(
          top: 2,
          left: 30,
          right: 8,
          bottom: 4
        ),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(15),
            )),
      ),
      alignment: Alignment.topRight,
    );
  }
}
