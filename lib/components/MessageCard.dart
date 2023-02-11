import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:health/screens/ChatScreen.dart';

import '../models/User.dart';
import '../screens/Login.dart';

class MessageCard extends StatelessWidget {
  MessageCard({super.key, required String message,required this.user}) {}
  String messages = "no message yet";
  User user;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
        child: GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(idUser: user.idUser??"23",),
                ),
              );
            },
 child: ListTile(
            title:  Text(
             user.name??"Unknown name",
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle:Text(
                messages),
            leading:user.urlAvatar != null? 
            CircleAvatar(
              foregroundImage: NetworkImage(user.urlAvatar??""),
              radius: 25,
            ):ProfilePicture(
            name: user.name??"Unknown User",
            radius: 25,
            fontsize: 21,
            tooltip: true,
        ),
            trailing: messages == '2'
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
