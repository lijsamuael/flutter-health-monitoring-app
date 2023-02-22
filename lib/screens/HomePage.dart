import 'package:flutter/material.dart';
import '../api/FirebaseApi.dart';
import '../components/DoctorsCard.dart';
import '../components/Header.dart';
import '../components/Category.dart';
import '../components/MessageCard.dart';
import '../models/User.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*0.9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Header(),
          // const Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Text(
          //     "Specialists",
          //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Container(
          //   height: 150,
          //   margin: const EdgeInsets.only(right: 10),
          //   width: double.infinity,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       Category("Radiographer"),
          //       Category("Sychatrist"),
          //       Category("Dentist"),
          //       Category("Heart Specialist"),
          //       Category("Heart Specialist"),
          //       Category("Heart Specialist"),
          //       Category("Heart Specialist"),
          //     ],
          //   ),
          // ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Available Doctors",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
             ///   
                   height: 400,
                  child: SafeArea(
             child: StreamBuilder<List<CUser>>(
            stream: FirebaseApi.getUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                 if (snapshot.hasError) {
                    print(snapshot.error);
                    return buildText('Something Went Wrong Try later');
                  } else {
                    final users = snapshot.data;
                    if (users!.isEmpty) {
                      return buildText('No Users Found');
                    } else {
                      return ListView.builder(   
                        itemBuilder: ((context, index) => (
                       DoctorsCard(user:users[index]))
                      ),
                      itemCount: users.length,
                      );
                    }
                 }
              }
            },
                 )
                 )),
          ),
       ///
      ]
      ),
      ); 
  }
    Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      );


}
