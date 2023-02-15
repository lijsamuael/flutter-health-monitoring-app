import 'package:flutter/material.dart';

class CurrentUserState extends ChangeNotifier {
  String? userId;
  String? imageUrl;
  // ignore: non_constant_identifier_names
  get UserId {
    return userId;
 }
  set setUserId(userId) {
    this.userId = userId;
    notifyListeners();
  }// ignore: non_constant_identifier_names
  get ImageUrl {
    return imageUrl;
  }
  // ignore: non_constant_identifier_names
  set ImageUrl(imageUrl) {
    ImageUrl = imageUrl;
    notifyListeners();
  }
}
