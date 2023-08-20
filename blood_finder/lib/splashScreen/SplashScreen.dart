import 'dart:async';

import 'package:blood_finder/bloodGroupScreen/blood_group_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BFSScreen extends StatefulWidget {
  const BFSScreen({super.key});

  @override
  State<BFSScreen> createState() => _BFSScreenState();
}

class _BFSScreenState extends State<BFSScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BloodGroupIdentify()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: SvgPicture.asset(
            'assets/images/Donar.svg',
            height: 149,
            width: 185,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/sponsered.png',
              height: 98,
              width: 213,
            ),
          ),
        ],
      ),
    );
  }
}
