import 'package:flutter/material.dart';
import 'package:health/components/DoctorsCard.dart';

import '../api/FirebaseApi.dart';
import '../components/MessageCard.dart';
import '../models/User.dart';
class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
          children: [
          Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  height: 30,
                  child: ListView.builder(
                    itemBuilder: ((context, index) => Container(
                          constraints: BoxConstraints(minWidth: 80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Text("psycology "),
                                  margin: EdgeInsets.only(right: 10)
                                  ),
                              Container(child: Text("34"))
                            ],
                          ),
                        )),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  )
                  ),
          ///   
 
                    Container(
                    height:MediaQuery.of(context).size.height*0.9,
                     child: StreamBuilder<List<CUser>>(
                     stream: FirebaseApi.getUsers(),
                                   builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(child: CircularProgressIndicator());
                        default:
                         if (snapshot.hasError) {
                            print(snapshot.error);
                            return Center(child: Text('Something Went Wrong Try later'));
                          } else {
                            final users = snapshot.data;
                            if (users!.isEmpty) {
                              return Center(child: Text('No Users Found'));
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
                        ),
                   )     
         ///
          ]
        ),
      
 );
  }



}
