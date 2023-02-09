import 'package:flutter/material.dart';
import 'package:health/components/PatentComponent.dart';

class AboutComponent extends StatelessWidget {
  const AboutComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 21,
        child: Container(margin: EdgeInsets.symmetric(vertical:15 ),
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
         Text("About Doctor Kidus",style:TextStyle(
          fontSize:15,fontWeight: FontWeight.w700,
          )),
         Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
          style:TextStyle(
          fontWeight: FontWeight.normal,
          height:1.4      
          )   
         ),
      Container( 
      margin:EdgeInsets.symmetric(vertical: 10),
      width:MediaQuery.of(context).size.width-20,
      height:50,
      child:Row(children: [ 
      Flexible(child:PatentComponent()) ,
      Flexible(child:PatentComponent()),
      Flexible(child:PatentComponent()) ,
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )
       ) ,     
ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:const Color.fromARGB(255, 49, 76, 230),
        minimumSize: const Size.fromHeight(45), // NEW
      ),
      onPressed: () {},
      child: const Text(
        'Book Appointment',
        style: TextStyle(fontSize: 15),
      ),)
   ],
 ) 
        ));
  }
}
