import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:health/state/ChatedUserState.dart';
import 'package:provider/provider.dart';

import '../screens/ChatScreen.dart';

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton(
      {this.phone,required this.color, required this.icon, required this.text, super.key});
  IconData icon;
  String text;
  Color color;
  String ? phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: OutlinedButton.icon(
        onPressed: (() => {
         if(icon==Icons.message){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(idUser: context.read<ChatedUserState>().getCurrentUser(),),
             ),
          )
         }
         
         else if (icon==Icons.video_call){
          callNumber
         }
         else{  
         }
        }
        ),
        icon: Icon(
          this.icon,
          color: Color.fromARGB(255, 240, 231, 231),
        ),
        label: Text(
          this.text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "RobotoCondensed",
              fontSize: 12,
              overflow: TextOverflow.ellipsis),
        ),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            side:BorderSide(width: 1, color: Color.fromARGB(255, 236, 230, 230)),
            backgroundColor: this.color),
      ),
    );
  }

callNumber() async{
  const number = '+251977580397';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
}
