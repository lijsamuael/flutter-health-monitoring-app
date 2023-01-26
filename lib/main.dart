import 'package:flutter/material.dart';
import './home/Header.dart';
import './home/Category.dart';
import 'home/Doctorscard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Icon(
              FontAwesomeIcons.message,
              color: Colors.black,
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Header(),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Specialists",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.only(right: 10),
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Category("Radiographer"),
                    Category("Sychatrist"),
                    Category("Dentist"),
                    Category("Heart Specialist"),
                    Category("Heart Specialist"),
                    Category("Heart Specialist"),
                    Category("Heart Specialist"),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Available Doctors",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Doctorscard(),
                    Doctorscard(),
                    Doctorscard(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
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
        ),
      ),
    );
  }
}
