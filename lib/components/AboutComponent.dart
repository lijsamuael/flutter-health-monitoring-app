import 'package:flutter/material.dart';
import 'package:health/components/PatentComponent.dart';
import 'package:health/state/ChatedUserState.dart';
import 'package:provider/provider.dart';

class AboutComponent extends StatelessWidget {
  const AboutComponent({super.key});

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<ChatedUserState>(context).getUserName;
    return SizedBox(
        width: MediaQuery.of(context).size.width - 21,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About Doctor $name",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )),
                const Text(
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, height: 1.4)),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                       Flexible(child:PatentComponent(type: "Experience",number:"7 years")),
                       Flexible(child:PatentComponent(type: "Patents",number:"150")),
                       Flexible(child:PatentComponent(type: "Reviews",number:"2.05 K"))

                      ],
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 49, 76, 230),
                    minimumSize: const Size.fromHeight(45), // NEW
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )));
  }
}
