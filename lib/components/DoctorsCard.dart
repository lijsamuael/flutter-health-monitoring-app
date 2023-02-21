import 'package:flutter/material.dart';
class Doctorscard extends StatelessWidget {
  Doctorscard({super.key}) {}
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('DoctorDetail'),
      child: Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Dr. Kidist Ketema",
                      )),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Mental Sychologist"),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(children: const [
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border)
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Expereince",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "7 Years",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Patients",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "160",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                      "assets/images/femaldoc1.jpg",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
