import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextstyle {
  static const TextStyle txt = TextStyle(
      fontFamily: "SofiaPro-Medium",
      fontSize: 11,
      color: Color(0xFF686d73),
      fontWeight: FontWeight.w500);
}

class CustomDecoration {
  static BoxDecoration boxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: const Color(0xFFadadad)));
}

class CustomSVgwithColor {
  static SvgPicture svgcl = SvgPicture.asset(
    "assets/images/radioButtonCl.svg",
    height: 25,
    width: 25,
  );
}

class CustomSvgwithoutCl {
  static SvgPicture svg = SvgPicture.asset(
    "assets/images/radioButton.svg",
    height: 25,
    width: 25,
  );
}
