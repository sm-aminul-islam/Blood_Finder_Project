import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BFSScreen extends StatefulWidget {
  const BFSScreen({super.key});

  @override
  State<BFSScreen> createState() => _BFSScreenState();
}

class _BFSScreenState extends State<BFSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: SvgPicture.asset(
            'Donar.svg',
            height: 149,
            width: 185,
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'sponsered.png',
              height: 98,
              width: 213,
            ),
          ),
        ],
      ),
    );
  }
}
