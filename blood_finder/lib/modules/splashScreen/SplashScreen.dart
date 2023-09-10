import 'dart:async';
import 'package:blood_finder/modules/dashboard/view/bloodviewScreen/bloodScreen.dart';

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
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BloodScreen()));
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/sponsered.png',
              height: 98,
              width: 213,
            ),
          ),
          Positioned(
            right: 120,
            top: 130,
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
              strokeWidth: 1,
            ),
          )
        ],
      ),
    );
  }
}
