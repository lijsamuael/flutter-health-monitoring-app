import 'package:meta/meta.dart';

import '../Utils.dart';
class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class CUser {
  final String? idUser;
  final String ?name;
  final String ?urlAvatar;
  final DateTime ?lastMessageTime;
  const CUser({
     this.lastMessageTime,
     this.idUser,
     this.name,
     this.urlAvatar, 
  });

  CUser copyWith({
    String ?idUser,
    String? name,
    String ?urlAvatar,
   DateTime? lastMessageTime,
  }) =>
      CUser(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  static CUser fromJson(Map<String, dynamic> json) => CUser(
        idUser: json['idUser'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime!),
      };
}