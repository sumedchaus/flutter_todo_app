import 'package:flutter/material.dart';
import 'package:flutter_todo_app/thems.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);
  String label;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        child: Text(label),
    style: ElevatedButton.styleFrom(

      onPrimary: Colors.white,
      primary: primaryClr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    );
  }
}
