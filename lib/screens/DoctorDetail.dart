
import 'package:flutter/material.dart';
import 'package:health/components/AboutComponent.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/CustomOutlinedButton.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: CustomAppBar(title: 'Doctor Kidist'),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Container(
                            width:340,
                            height:290,
                        //     child: Flexible(
                        //     child: Padding(
                        //       padding: EdgeInsets.only(top:15),
                        //       child: Image.asset(
                        //         'assets/images/mendoc.jpg',
                        //         fit: BoxFit.cover,
                        //         alignment: Alignment.center,
                        //       ),
                        //     ),
                        //  ),
                     decoration:const BoxDecoration(   
                       image:DecorationImage(
                        image: AssetImage('assets/images/femaldoc1.jpg',
                       ) ,
                       fit:BoxFit.contain
                       
                       )
                     )
                          ),
                    
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                            Flexible(
                               child: CustomOutlinedButton(
                              color: Colors.green,
                              icon: Icons.call_outlined,
                              text: 'Voice Call',
                            )),
                           Flexible(
                                child: CustomOutlinedButton(
                                    color: Colors.purpleAccent,
                                    icon: Icons.video_call,
                                    text: 'Video call')),
                            Flexible(
                                child: CustomOutlinedButton(
                                    color: const Color.fromARGB(255, 49, 76, 230),
                                    icon: Icons.message,
                                    text: 'Message'))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 3, bottom: 1),
                        child: const Text("Medicine and Heart Specialist",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1, bottom: 3),
                        child: const Text("BahirDar,EThiopia",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 247, 84, 72)),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 247, 84, 72)),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 247, 84, 72)),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 247, 84, 72)),
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 247, 84, 72))
                        ],
                      ),
                       const AboutComponent(),
                    ]),
              ),
            ));
  }

 
}
