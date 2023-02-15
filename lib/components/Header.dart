import 'package:flutter/material.dart';
import '../screens/DiseasePrediction.dart';
class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    hintText: 'Search a doctors, categories ...',
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.search),
              )
            ],
          ),
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), 
              ),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Row(
              children: [
                SizedBox(
                  width: 220,
                  child: Column(
                    children:  [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Lookining For Your Desire Specialist Doctors?",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push((context), MaterialPageRoute(
                        builder: (context) =>  const DiseasePrediction()));
                           },
                          child: const Text(
                            "Or tell us sympthom we will help you cure yourself!",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/mendoc.jpg",
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      height: 150,
                    ),
                  ),
                )
              ],
            ),
          )
          //
        ],
      ),
    );
  }
}
