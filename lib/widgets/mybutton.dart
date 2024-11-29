import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String text;

  const MyButton({super.key,required this.color,required this.textcolor, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
        child: Center(child: Text(text,style: TextStyle(color: textcolor),)),
      )
      ),
    );
  }
}
