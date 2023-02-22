import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:health/components/AboutComponent.dart';
import 'package:health/state/ChatedUserState.dart';
import 'package:provider/provider.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/CustomOutlinedButton.dart';

class DoctorDetail extends StatelessWidget {
  int?index;
 DoctorDetail({this.index,super.key });
  @override
  Widget build(BuildContext context) {
    var userInfo = Provider.of<ChatedUserState>(context, listen: false);
    return Scaffold(
        appBar: CustomAppBar(
          title: userInfo.getUserName,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 340,
                      height: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(userInfo.photoUrl),
                              fit: BoxFit.fill))
                               
                              
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
                      Icon(Icons.star, color: Color.fromARGB(255, 247, 84, 72)),
                      Icon(Icons.star, color: Color.fromARGB(255, 247, 84, 72)),
                      Icon(Icons.star, color: Color.fromARGB(255, 247, 84, 72)),
                      Icon(Icons.star, color: Color.fromARGB(255, 247, 84, 72)),
                      Icon(Icons.star, color: Color.fromARGB(255, 247, 84, 72))
                    ],
                  ),
                  const AboutComponent(),
                ]),
          ),
        ));
  }

  callNumber() async{
  const number = '+251977580397';
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
}
