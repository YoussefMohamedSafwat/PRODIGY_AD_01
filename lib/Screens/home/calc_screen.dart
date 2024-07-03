import 'package:flutter/material.dart';

class CalcScreen extends StatelessWidget {
  CalcScreen({super.key, required this.screenText});
  final String screenText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10),
      height: size.height * 0.3,
      width: size.width * 1,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.grey),
      child: Stack(
        children: [
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                screenText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
