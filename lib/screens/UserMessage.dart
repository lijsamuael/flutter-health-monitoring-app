import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/MessageCard.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        extendBody: true,
        appBar: AppBar(
          // elevation: 0,
          title: const Text(
            "Messages",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey[200],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            MessageCard('1'),
            MessageCard(''),
            MessageCard(''),
            MessageCard('3'),
            MessageCard(''),
            MessageCard(''),
            MessageCard('1'),
            MessageCard('1'),
            MessageCard('5'),
            MessageCard('6'),
            MessageCard(''),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
            // MessageCard(),
          ],
        ),
      ),
    );
  }
}
