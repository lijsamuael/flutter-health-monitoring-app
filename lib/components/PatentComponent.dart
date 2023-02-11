
import 'package:flutter/material.dart';
class PatentComponent extends StatelessWidget {
  const PatentComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 40,
        child: Column(
          
          children: const [
            Flexible(
              child: Text("Patents",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            Text('200')
          ],
        ));
  }
}
