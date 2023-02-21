// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CurrentUserState extends ChangeNotifier {
  String? userId;
  String? imageUrl;
  get UserId {
    return userId;
 }
  set setUserId(userId) {
    this.userId = userId;
    notifyListeners();
  }
  get ImageUrl {
    return imageUrl;
  }
  set ImageUrl(imageUrl) {
    ImageUrl = imageUrl;
    notifyListeners();
  }
}
