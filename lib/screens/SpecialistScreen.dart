import 'package:flutter/material.dart';
import 'package:health/components/DoctorsCard.dart';
import '../widgets/CustomAppBar.dart';
class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:SingleChildScrollView(
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
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(4),
                      )),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                )
                ),
         Container(
         margin:EdgeInsets.symmetric(horizontal: 10,),
         child: Doctorscard(), 
         ),
        Container(
         margin:EdgeInsets.symmetric(horizontal: 10),
         child: Doctorscard(), 
         ),
         Container(
         margin:EdgeInsets.symmetric(horizontal: 10),
         child: Doctorscard(), 
         ),
         Container(
         margin:EdgeInsets.symmetric(horizontal: 10),
         child: Doctorscard(), 
         ),
         Container(
         margin:EdgeInsets.symmetric(horizontal: 10),
         child: Doctorscard(), 
         ),
          ]),
 ),
     
    );
  }
}
