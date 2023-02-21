import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Message.dart';
import '../models/User.dart';
import '../Utils.dart';

class FirebaseApi {
  static Stream<List<CUser>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(CUser.fromJson));
  static Future uploadMessage(String idUser, String message) async {
    final user = FirebaseAuth.instance.currentUser!;
    var currentUserId = user.uid;
    final refMessages = FirebaseFirestore.instance
        .collection('chats/$currentUserId$idUser/messages');
    final newMessage = Message(
      idUser:'$currentUserId$idUser',
      urlAvatar:user.photoURL ?? "",
      username: user.displayName ?? "",
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());
    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers
        .doc(idUser)
        .update({UserField.lastMessageTime: DateTime.now()});
  }
  static Stream<List<Message>> getMessages(String idUser, String CurrentUserId) =>
      FirebaseFirestore.instance
          .collection('chats/$CurrentUserId$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<CUser> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');
    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(idUser: userDoc.id);
        await userDoc.set(newUser.toJson());
      }
    }
  }
}
