import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/User.dart';
import '../state/ChatedUserState.dart';

class DoctorsCard extends StatelessWidget {
  CUser user;
  DoctorsCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>{
        Provider.of<ChatedUserState>(context, listen: false)
            .setUserId(user.idUser ?? "No Id"),
        Provider.of<ChatedUserState>(context, listen: false)
            .setUserName(user.name ?? "No Name"),
        Provider.of<ChatedUserState>(context, listen: false).setPhotoUrl(user
                .urlAvatar ??
            "https://directory.wkhs.com/sites/default/files/hg-features/hg-providers/default-male.jpg"),
        Navigator.of(context).pushNamed('DoctorDetail')
      },
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
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(user.name ?? "Un Known Doctor",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
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
                    height: 15,
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
                    height: 5,
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
                  const SizedBox(
                    height: 5,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      user.urlAvatar ?? "",
                    ),
                    fit: BoxFit.cover,
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
