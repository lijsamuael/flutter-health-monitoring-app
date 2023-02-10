import '../models/User.dart';
import 'package:flutter/material.dart';
import '../widget/MessagesWidget.dart';
import '../widget/NewMessageWidget.dart';
import '../widget/ProfileHeaderWidget.dart';
class ChatPage extends StatefulWidget {
  final User user;
  const ChatPage({
  required this.user,
  }) ;
  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(name:widget.user.name??"default name"),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(idUser: widget.user.idUser??"default id"),
                ),
              ),
              NewMessageWidget(idUser:widget.user.idUser??"default id")
            ],
          ),
        ),
      );
}