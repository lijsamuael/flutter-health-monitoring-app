import 'package:flutter/material.dart';

class ChatedUserState extends ChangeNotifier {
  static String? idUser;
  static String? name;
  static String? urlAvatar;
  DateTime? lastMessageTime;
  String getCurrentUser() {
    return idUser ?? "no id";
  }
 String  get getUserName {
    return name ?? "NO User";
  }
  String get  getUserId {
    return idUser ?? "No user";
  }
  String get  photoUrl {
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
}
