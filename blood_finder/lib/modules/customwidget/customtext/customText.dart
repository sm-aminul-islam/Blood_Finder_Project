import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.family,
      required this.size,
      required this.color,
      this.fontWeight});

  final String text;
  final String? family;
  final double size;
  final Color color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: family,
        fontSize: size,
        color: color,
      ),
    );
  }
}
