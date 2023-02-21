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
      child: Column(
        children: [
          const Header(),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Specialists",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 760,
            width: double.infinity,
            child: Category(),
          ),
        ],
      ),
    );
  }
}
