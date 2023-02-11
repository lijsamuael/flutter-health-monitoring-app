import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class CurrentUserState extends ChangeNotifier {
 static  String? idUser;
  static String? name;
  static String? urlAvatar;
  static DateTime? lastMessageTime;

final user = FirebaseAuth.instance.currentUser!;
setUserInfo(){
  
}}
