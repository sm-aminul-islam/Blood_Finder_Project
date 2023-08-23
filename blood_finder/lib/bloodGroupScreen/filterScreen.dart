import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24,
              color: const Color(0xFF000000).withOpacity(0.08),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: const Color(0xFFf5f5f5),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/combined_shape.svg",
                        height: 21,
                        width: 13,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "Filter by",
                        style: TextStyle(
                            fontFamily: "SofiaPro-SemiBold",
                            fontSize: 17,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BLOOD GROUP",
                        style: TextStyle(
                            fontFamily: "SofiaPro-SemiBold",
                            fontSize: 13,
                            color: Color(0xFFd1001c)),
                      ),
                      Text(
                        "COMPANY",
                        style: TextStyle(
                            fontFamily: "SofiaPro-SemiBold",
                            fontSize: 13,
                            color: Color(0xFFadadad)),
                      ),
                      Text(
                        "GENDER",
                        style: TextStyle(
                            fontFamily: "SofiaPro-SemiBold",
                            fontSize: 13,
                            color: Color(0xFFadadad)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              width: 130,
              color: Color(0xFFd1001c),
            ),
            const SizedBox(
              height: 40,
              width: 34,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Color(0xFFd1001c), shape: BoxShape.circle),
              child: Center(
                child: Text(
                  "A+",
                  style: TextStyle(
                      fontFamily: "SofiaPro-SemiBold",
                      fontSize: 18,
                      color: Color(0xFFffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
