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
    return MaterialApp(
        routes: <String, WidgetBuilder> {
     
    'Login':(BuildContext context) => Message(),
    'ChatScreen' : (BuildContext context) =>const ChatScreen(),
    'DoctorDetail' : (BuildContext context) =>DoctorDetail(),
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
                    children: const [
                      CircleAvatar(
                        foregroundImage:
                            AssetImage("assets/images/femaldoc1.jpg"),
                        maxRadius: 50,
                      ),
                      Center(
                        child: Text("Elsabet Molla"),
                      )
                    ],
                  ),
                ),
                Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.gear),
                      title: Text("Setting"),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_sharp),
                      title: Text("Logout"),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Help"),
                    )
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
