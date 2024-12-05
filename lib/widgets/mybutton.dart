import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String text;
  final buttonTap;

  const MyButton(
      {super.key,
      required this.color,
      required this.textcolor,
      required this.text,
      required this.buttonTap});

  @override
  Widget build(BuildContext context) {
    Offset distance = Offset(28, 28);
    double blur = 30;
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                  child: Text(
                text,
                style: TextStyle(color: textcolor, fontSize: 20),
              )),
            )),
      ),
    );
  }
}
