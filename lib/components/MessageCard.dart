import 'package:flutter/material.dart';

import '../screens/Login.dart';

class MessageCard extends StatelessWidget {
  MessageCard(String messages, {super.key}) {
    this.messages = messages;
  }

  String messages = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Message()),
        );
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
          color: Colors.white,
        ),
        child: ListTile(
          title: const Text(
            "Dr. Kidist Ketema",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: const Text(
              "Hey, samuael you are very well know do not worry more..."),
          leading: const CircleAvatar(
            foregroundImage: AssetImage("assets/images/femaldoc1.jpg"),
          ),
          trailing: messages == ''
              ? const SizedBox.shrink()
              : CircleAvatar(
                  radius: 10,
                  child: Text(
                    messages,
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ),
    );
  }
}
