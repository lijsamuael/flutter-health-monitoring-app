import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'screens/HomePage.dart';
import 'screens/AppointmentPage.dart';
import 'screens/ProfilePage.dart';
import 'screens/DoctorsPage.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _currentIndex = 0;
  static const List<Widget> _children = [
    HomePage(),
    DoctorsPage(),
    AppointmentPage(),
    ProfilePage(),
  ];

  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          // leading: const Icon(
          //   Icons.menu,
          //   color: Colors.black,
          // ),
          actions: const [
            Icon(
              FontAwesomeIcons.message,
              color: Colors.black,
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
                padding: const EdgeInsets.only(bottom: 0, top: 50),
                child: Column(
                  children: const [
                    CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/femaldoc1.jpg"),
                      maxRadius: 50,
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   "Dr. Kidist Ketema",
                    //   style: TextStyle(fontWeight: FontWeight.w400),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(
                    //   height: 7,
                    // ),
                    // Text(
                    //   "Mental Psychologist",
                    //   style: TextStyle(fontWeight: FontWeight.w400),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
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
    );
  }
}
