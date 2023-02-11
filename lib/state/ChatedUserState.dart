import 'package:flutter/material.dart';

class ChatedUserState extends ChangeNotifier {
  String? idUser;
  String? name;
  String? urlAvatar;
  DateTime? lastMessageTime;
  ChatedUserState(
      {this.idUser, this.name, this.urlAvatar, this.lastMessageTime});

  String getCurrentUser() {
    return this.idUser??"no id";
    notifyListeners();
  }

  setUser(idUser) {
    this.idUser = idUser;
    notifyListeners();
  }
}
