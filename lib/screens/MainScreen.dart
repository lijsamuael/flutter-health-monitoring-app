import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health/screens/ChatScreen.dart';
import 'package:health/screens/DoctorDetail.dart';
import 'package:health/screens/Login.dart';
import 'package:health/screens/ProfileScreen.dart';
import 'HomePage.dart';
import 'AppointmentPage.dart';
import 'ProfileScreen.dart';
import 'SpecialistScreen.dart';
import 'UserMessage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  static const List<Widget> _children = [
    HomePage(),
    SpecialistScreen(),
    AppointmentPage(),
    ProfileScreen(),
  ];

  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'Login': (BuildContext context) => Login(),
        'ChatScreen': (BuildContext context) => const ChatScreen(),
        'DoctorDetail': (BuildContext context) => DoctorDetail(),
      },
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            // leading: const Icon(
            //   Icons.menu,
            //   color: Colors.black,
            // ),
            actions: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.comment),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserMessage()),
                  );
                },
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  // margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 0, top: 30),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        foregroundImage:
                            AssetImage("assets/images/femaldoc1.jpg"),
                        maxRadius: 50,
                      ),
                      Center(
                        child: Text(user.email!),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: TextButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        child: const Text("Profile"),
                        onPressed: () => FirebaseAuth.instance.signOut(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.gear),
                      title: TextButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        child: const Text("Setting"),
                        onPressed: () => FirebaseAuth.instance.signOut(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout_sharp),
                      title: TextButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        child: const Text("Logout"),
                        onPressed: () => FirebaseAuth.instance.signOut(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.circleQuestion),
                      title: TextButton(
                        style: const ButtonStyle(
                          alignment: Alignment.centerLeft,
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                        ),
                        child: const Text("Help"),
                        onPressed: () => FirebaseAuth.instance.signOut(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: _children.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userDoctor),
                label: 'Docotors',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calendarCheck),
                label: 'Appointment',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: onTapBar,
          ),
        ),
      ),
    );
  }
}
