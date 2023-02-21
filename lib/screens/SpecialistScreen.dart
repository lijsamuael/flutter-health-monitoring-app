import 'package:flutter/material.dart';
import 'package:health/components/DoctorsCard.dart';
import '../widgets/CustomAppBar.dart';

class SpecialistScreen extends StatelessWidget {
  const SpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              height: 30,
              child: ListView.builder(
                itemBuilder: ((context, index) => Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const Text("psycology ")),
                          Container(child: Text("34"))
                        ],
                      ),
                    )),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              )),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Doctorscard(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Doctorscard(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Doctorscard(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Doctorscard(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Doctorscard(),
          ),
        ]),
      ),
    );
  }
}
