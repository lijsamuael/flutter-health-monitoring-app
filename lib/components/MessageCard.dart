import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:health/screens/ChatScreen.dart';
import 'package:health/state/ChatedUserState.dart';
import 'package:provider/provider.dart';
import '../models/User.dart';

class MessageCard extends StatelessWidget {
  MessageCard({super.key, required String message, required this.user}) { 
  }
  CUser user;
  String messages = "no message yet";
  @override
  Widget build(BuildContext context) {   
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 42, 152, 243),
          ),
        ),
        color: Colors.white,
      ),
      
      child: GestureDetector(
        onTap: () {
        Provider.of<ChatedUserState>(context,listen: false).setUserId(user.idUser??"No Id");
        Provider.of<ChatedUserState>(context,listen: false).setUserName(user.name ?? "No Name");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
              idUser: Provider.of<ChatedUserState>(context,listen:true).getUserId,
             ),
            ),
          );  
        },

        child: ListTile(
          title: Text(
            user.name ?? "Unknown name",
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
            subtitle: Text(messages),
            leading: user.urlAvatar != null
            ? CircleAvatar(
             foregroundImage: NetworkImage(user.urlAvatar ?? ""),
             radius: 25,
                )
              : ProfilePicture(
                 name: user.name ?? "Unknown User",
                 radius: 25,
                 fontsize: 21,
                 tooltip: true,
         ),  
        ),
      ),
    );
  }
}
