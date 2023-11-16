// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  Function show;
  Color color;
  String text;
  Button({required this.text,required this.color,required this.show});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:color ,//Color(0x50505050),
        shape: BoxShape.circle,
      ),
      // color: Colors.cyan,
      width: 80,
      height: 95,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
        onPressed:()=> show(text),
      ),
    );
  }
}
