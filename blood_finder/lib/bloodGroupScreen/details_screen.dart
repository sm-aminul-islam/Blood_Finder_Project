import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24,
              width: double.infinity,
              color: const Color(0xFF000000).withOpacity(0.08),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              height: 218,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFfbfbfb), Color(0xFFf2f2f2)]),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 21,
                        width: 13,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          "assets/images/combined_shape.svg",
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 22,
                        width: 130,
                        child: const Text(
                          "Doner Details",
                          style: TextStyle(
                            fontFamily: "SofiaPro-SemiBold",
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/images/blood_drop.svg",
                          height: 81,
                          width: 80,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(17),
                        child: Text(
                          "A+",
                          style: TextStyle(
                            fontFamily: 'SofiaPro-SemiBold',
                            fontSize: 22,
                            color: Color(0xFFd1001c),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 230,
                    child: Text(
                      "Mohammad Masudur Rahman",
                      style: TextStyle(
                        fontFamily: 'SofiaPro-Medium',
                        fontSize: 15,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Phone number',
                      style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '+8801911967811',
                      style: TextStyle(
                          fontFamily: 'SofiaPro-Medium',
                          fontSize: 14,
                          color: Color(0xFF000000)),
                    ),
                  ],
                ),
                Container(
                  height: 36,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFf5f5f5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/images/phone-Icon.svg",
                        height: 15,
                        width: 15,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-SemiBold',
                          fontSize: 12,
                          color: Color(0xFF000000),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 1,
              width: 300,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
              )),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'masudur.rahman@sslwireless.com',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'SSL Wireless',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Employee ID',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '1248',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Finance & Account',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Designation',
                        style: TextStyle(
                          fontFamily: 'SofiaPro-Regular',
                          fontSize: 11,
                          color: Color(0xFF94989e),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Assistant Manager',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
