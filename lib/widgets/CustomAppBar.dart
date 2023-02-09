import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  CustomAppBar( {super.key, required this.title});
  late String title;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:()=>Navigator.of(context).pop(),
      child: AppBar(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              toolbarHeight: 40,
              backgroundColor: Colors.white,
              elevation: 1,
            ),
    );     
  } 
  @override
  Size get preferredSize => const Size.fromHeight(40);
}
