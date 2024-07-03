import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcButton extends StatelessWidget {
  CalcButton(
      {super.key,
      required this.buttonColor,
      required this.text,
      required this.onPressed,
      this.icon});

  final Color buttonColor;
  final String text;
  final Function onPressed;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
        child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                  )),
      ),
    );
  }
}
