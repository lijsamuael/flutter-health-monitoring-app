import 'package:flutter/material.dart';
import '../Utils.dart';
class MessageField {
  static final String createdAt = 'createdAt';
}
class Message {
  final String idUser;
  final String urlAvatar;
  final String username;
  final String message;
  final DateTime ?createdAt;
  const Message({
    this.createdAt, 
    required this.idUser,
    required this.urlAvatar,
    required this.username,
    required this.message,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        idUser: json['idUser'],
        urlAvatar: json['urlAvatar'],
        username: json['username'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'urlAvatar': urlAvatar,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt!),
      };
}