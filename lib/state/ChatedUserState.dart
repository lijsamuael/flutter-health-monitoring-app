import 'package:flutter/material.dart';

class ChatedUserState extends ChangeNotifier {
  static String? idUser;
  static String? name;
  static String? urlAvatar;
  DateTime? lastMessageTime;
 
 String  get getUserName {
    return name ?? "NO User";
  }
  String get  getUserId {
    return idUser ?? "No Id";
  }
  String get photoUrl {
    return urlAvatar ?? "No user";
  }
  void setUserId(String s) {
    idUser = s;
    notifyListeners();
  }

  void setUserName(String s) {
    name = s;
    notifyListeners();
  }
  void setPhotoUrl(String s) {
   urlAvatar = s;
  notifyListeners();
  }
}
