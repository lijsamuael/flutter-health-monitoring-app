import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health/screens/Login.dart';
import 'package:health/state/ChatedUserState.dart';
import 'package:health/state/CurrentUserState.dart';
import 'package:health/users.dart';
import 'api/FirebaseApi.dart';
import 'package:health/screens/MainScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(CUsers.initUsers);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ChatedUserState>(
        create: (context) => ChatedUserState(),
      ),
      ChangeNotifierProvider<CurrentUserState>(
        create: (context) => CurrentUserState(),)
    ],
    child: const MyWidget(),
  ));
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong!!!"),
                );
              } else if (snapshot.hasData) {
                return const MainScreen();
              } else {
                return Login();
              }
            }),
      ),
    );
  }
}
