import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/api/FirebaseApi.dart';
import 'package:health/models/User.dart';
import '../components/MessageCard.dart';
class UserMessage extends StatelessWidget {
  const UserMessage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SafeArea(
           child: StreamBuilder<List<CUser>>(
          stream: FirebaseApi.getUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
               if (snapshot.hasError) {
                  print(snapshot.error);
                  return buildText('Something Went Wrong Try later');
                } else {
                  final users = snapshot.data;
                  if (users!.isEmpty) {
                    return buildText('No Users Found');
                  } else {
                    return ListView.builder(   
                      itemBuilder: ((context, index) => (
                     MessageCard(message:"new message",user:users[index]))
                    ),
                    itemCount: users.length,
                    );
                  }
               }
            }
          },
       )
       )
       );
  }
  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
