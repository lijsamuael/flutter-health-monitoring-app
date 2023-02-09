
import 'package:flutter/material.dart';
import 'package:health/screens/AppointmentSetting.dart';
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AppointmentSetting()),
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              // spreadRadius: 2,
              // blurRadius: 1,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(5),
        height: 100,
        // width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Align(
                  child: Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "12 Aug 2022",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Booking For",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Dentist",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Time",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "2:40 PM",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Place"),
                Text(
                  "Bahir Dar",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Doctor",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "Dr. Kidist Ketema",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(234, 237, 1, 1),
                  ),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
