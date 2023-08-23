import 'package:blood_finder/bloodModel/bloodgroupModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.userdetails});
  final Person userdetails;
  void directPhoneCall() async {
    await FlutterPhoneDirectCaller.callNumber('01911967811');
  }

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
              padding: const EdgeInsets.all(15),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/images/combined_shape.svg",
                          height: 21,
                          width: 13,
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      const Text(
                        "Donar Details",
                        style: TextStyle(
                          fontFamily: "SofiaPro-SemiBold",
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/blood_drop.svg",
                        height: 120,
                        width: 120,
                      ),
                      Positioned(
                        top: 30,
                        child: Text(
                          userdetails.bgroup ?? "",
                          style: const TextStyle(
                            fontFamily: 'SofiaPro-SemiBold',
                            fontSize: 22,
                            color: Color(0xFFd1001c),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    userdetails.name ?? "",
                    style: const TextStyle(
                      fontFamily: 'SofiaPro-Medium',
                      fontSize: 17,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone number',
                            style: TextStyle(
                                fontFamily: 'SofiaPro-Regular',
                                fontSize: 11,
                                color: Color(0xFF94989e)),
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
                            GestureDetector(
                              onTap: () {
                                directPhoneCall();
                              },
                              child: SvgPicture.asset(
                                "assets/images/phone-Icon.svg",
                                height: 15,
                                width: 15,
                              ),
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
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontFamily: 'SofiaPro-Regular',
                      fontSize: 11,
                      color: Color(0xFF94989e),
                    ),
                  ),
                  Text(
                    'masudur.rahman@sslwireless.com',
                    style: TextStyle(
                        fontFamily: 'SofiaPro-Medium',
                        fontSize: 14,
                        color: Color(0xFF000000)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: const BoxDecoration(
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
                      Text(
                        userdetails.prof ?? "",
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
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFe6e6e6)),
                    )),
                  ),
                  const SizedBox(
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
                      Text(
                        'Assistant Manager',
                        style: TextStyle(
                            fontFamily: 'SofiaPro-Medium',
                            fontSize: 14,
                            color: const Color(0xFF000000)),
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
