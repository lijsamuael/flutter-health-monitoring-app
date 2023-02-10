import 'package:flutter/material.dart';
import 'package:health/components/ChatAccepter.dart';
import 'package:health/components/ChatSender.dart';
import 'package:health/widgets/CustomAppBar.dart';
class ChatScreen extends StatefulWidget {
const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatAcreenState();
}

class _ChatAcreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: CustomAppBar(title: "Message"),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 210, 226, 247),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Expanded(
                 child: ListView( 
                   children:  [ 
                    ChatSender(message: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface "),
                    ChatReceiver(message: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface "),
                    ChatSender(message: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface "),
                     ChatSender(message: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface "),
                    ChatReceiver(message: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface "),
                    ChatSender(message: "hello chat")
                    ], 
                 ),
             
           ) , 
       Container(
        margin: EdgeInsets.only(bottom:0),
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
                    icon: const Icon(Icons.image_outlined , color: Colors.blueAccent,), onPressed: () {}),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type Something...",
                          hintStyle: TextStyle( color:Colors.black),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.photo_camera ,color: Color(0xFF267ebd)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send_rounded,  color: Color(0xFF267ebd)),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
        ),
      )],
       ),  
      ), 
    );
}
}