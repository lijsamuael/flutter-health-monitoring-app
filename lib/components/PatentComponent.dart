import 'package:flutter/material.dart';

class PatentComponent extends StatelessWidget {
  String type,number;
 PatentComponent({super.key,required this.type,required this.number});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 40,
        child: Column(
          children:  [
            Flexible(
              child: Text(type,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Text(number)
          ],
        ));
  }
}
