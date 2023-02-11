import 'package:flutter/material.dart';
import '../components/DoctorsCard.dart';
import '../components/Header.dart';
import '../components/Category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Header(),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Specialists",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            margin: const EdgeInsets.only(right: 10),
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Category("Radiographer"),
                Category("Sychatrist"),
                Category("Dentist"),
                Category("Heart Specialist"),
                Category("Heart Specialist"),
                Category("Heart Specialist"),
                Category("Heart Specialist"),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Available Doctors",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Doctorscard(),
                Doctorscard(),
                Doctorscard(),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('See More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
