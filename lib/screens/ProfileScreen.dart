import 'package:flutter/material.dart';
import 'package:health/widgets/CustomTextField.dart';

class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:SingleChildScrollView(
      child: Container( 
      margin:const EdgeInsets.only(top:10,bottom:65,left: 10,right: 10),
      child:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
          height:160,
           child: Stack(
            children: [ 
            Container(
            margin:const EdgeInsets.only(bottom: 15),
            width:500,
            height:130,
             decoration: const BoxDecoration(
                    color:Color.fromARGB(255, 155, 144, 148)
                    ),
               ),
              Positioned(
               left:60,
               top: 60,
               right: 30,
           child: Stack(
             children:const [
               CircleAvatar( 
              backgroundImage:AssetImage('assets/images/olddoc1.jpg', 
             ),
             radius: 50,
             ),
             Positioned(
              top:55,
              left:65,
               child: CircleAvatar(   
                   backgroundColor: Color.fromARGB(255, 150, 135, 140),   
                   child:Icon(Icons.add_a_photo_outlined, 
                   color:Colors.white,
                   ),
               ),
             )  
             ]
             ),
              ),
            // Positioned(
            //    top:20,
            //   child: Icon(Icons.arrow_back, 
            //   color:Color.fromARGB(255, 247, 242, 242)
            //   ),
            // ),
            Positioned(child: Text("EditProfile ",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color:Colors.black)) ,
             left: 50,
             top:20
            ),
             
           ],
           ),
         ),
     
        CustomTextField(label: "Full Name") ,   
        CustomTextField(label: "Email"),
        CustomTextField(label: "Phone"),
        CustomTextField(label: "Password",icon:Icons.remove_red_eye),
         Align(
          alignment: Alignment.bottomLeft,
           child: ElevatedButton(
               style: ElevatedButton.styleFrom(
            backgroundColor:Color.fromARGB(255, 40, 61, 177),
            minimumSize: const Size.fromHeight(45), // NEW
               ),
               onPressed: () {},
               child: const Text(
            'Save Changes',
            style: TextStyle(fontSize: 15),
               ),),
         ) 
        ],
      )
      ),
    )
    );
  }
}
