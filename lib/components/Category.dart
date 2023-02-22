import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DoctorsCard.dart';

class Category extends StatelessWidget {
  Category({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          const Material(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.heart_broken,
                      color: Colors.black,
                    ),
                    text: "Heart Specialist",
                  ),
                  Tab(
                    icon: Icon(Icons.car_rental, color: Colors.black),
                    text: "Dentist",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike, color: Colors.black),
                    text: "Radiographer",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car, color: Colors.black),
                    text: "General Doctors",
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      // Doctorscard(),
                      // Doctorscard(),
                      // Doctorscard(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('See More'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Doctorscard(),
                      // Doctorscard(),
                      // Doctorscard(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('See More'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Doctorscard(),
                      // Doctorscard(),
                      // Doctorscard(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('See More'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Doctorscard(),
                      // Doctorscard(),
                      // Doctorscard(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('See More'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
