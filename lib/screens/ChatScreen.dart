import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/components/ChatAccepter.dart';
import 'package:health/components/ChatSender.dart';
import 'package:health/widgets/CustomAppBar.dart';
import 'package:provider/provider.dart';
import '../api/FirebaseApi.dart';
import '../models/Message.dart';
import '../state/ChatedUserState.dart';

class ChatScreen extends StatefulWidget {
  String idUser;
  ChatScreen({super.key, required this.idUser});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var MessageController = TextEditingController();
  String customMessage = '';

  @override
  Widget build(BuildContext context) {
    var idUser = ModalRoute.of(context)!.settings.arguments.toString();
    var Currentuser = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: CustomAppBar(
        title: context.read<ChatedUserState>().getUserName,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 210, 226, 247),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
             child: StreamBuilder<List<Message>>(
              stream: FirebaseApi.getMessages(widget.idUser, Currentuser),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return buildText('Something Went Wrong Try later');
                    } else {
                      final messages = snapshot.data;
                      return messages!.isEmpty
                          ? buildText('Say Hi..')
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              reverse: true,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                final message = messages[index];
                                return SenderOrAccepter(message,
                                message.idUser!="$Currentuser$idUser");
                              },
                            );
                    }
                }
              },
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 0, right: 5, left: 5),
              height: 61,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey)
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.image_outlined,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {}),
                          Expanded(
                            child: TextField(
                              controller: MessageController,
                              textCapitalization: TextCapitalization.sentences,
                              autocorrect: true,
                              decoration: const InputDecoration(
                                  hintText: "Type Something...",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none),
                              onChanged: (value) => setState(() {
                                customMessage = value;
                              }),
                            ),
                          ),
                          GestureDetector(
                            onTap: customMessage.trim().isEmpty
                                ? null
                                : sendMessage,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 13),
                              child: Icon(
                                Icons.send,
                                color: Color(0xFF267ebd),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
  SenderOrAccepter(Message message,bool isme) {
    if (isme) {
      return ChatSender(message: message);
    } else {
      return ChatAccepter(message: message);
    }
  }

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    MessageController.clear();
    await FirebaseApi.uploadMessage(widget.idUser, customMessage);
  }
}
