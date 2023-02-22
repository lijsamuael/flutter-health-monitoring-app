import 'package:flutter/material.dart';
import '../components/AppointmentCard.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     height:MediaQuery.of(context).size.height*0.9,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              // color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Upcoming", style: TextStyle(fontSize: 20)),
                Text("Past", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
                AppointmentCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
