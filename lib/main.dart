import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health/page/ChatsPage.dart';
import 'package:health/screens/ChatScreen.dart';
import 'package:health/screens/DoctorDetail.dart';
import 'package:health/screens/Login.dart';
import 'package:health/screens/ProfileScreen.dart';
import 'package:health/users.dart';
import 'api/FirebaseApi.dart';
import 'screens/HomePage.dart';
import 'screens/AppointmentPage.dart';
import 'screens/ProfileScreen.dart';
import 'screens/SpecialistScreen.dart';
import 'screens/UserMessage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:health/screens/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);

runApp(const MyWidget());
}

class MyApp extends StatelessWidget {
  static final String title = 'Firebase Chat';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: ChatsPage(),
      );
}


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) => MaterialApp(
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
