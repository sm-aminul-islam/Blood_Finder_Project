import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:blood_finder/modules/Dashboard/Model/bloodgroupModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.userdetails});
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
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFfbfbfb), Color(0xFFf2f2f2)]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText(
                        text: "Donar Details",
                        family: "SofiaPro-SemiBold",
                        size: 16,
                        color: Color(0xFF000000),
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
                        child: CustomText(
                          text: userdetails.bgroup ?? "",
                          family: "SofiaPro-SemiBold",
                          size: 22,
                          color: Color(0xFFd1001c),
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: userdetails.name ?? "",
                    family: 'SofiaPro-Medium',
                    size: 17,
                    color: const Color(0xFF000000),
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
                          CustomText(
                            text: "Phone number",
                            family: "SofiaPro-Regular",
                            size: 11,
                            color: Color(0xFF94989e),
                          ),
                          CustomText(
                            text: "+8801911967811",
                            family: 'SofiaPro-Medium',
                            size: 14,
                            color: Color(0xFF000000),
                          ),
                        ],
                      ),
                      Container(
                        height: 36,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFf5f5f5)),
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
                            const CustomText(
                              text: "CALL",
                              family: "SofiaPro-SemiBold",
                              size: 12,
                              color: Color(0xFF000000),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                  const CustomText(
                    text: "Email Address",
                    family: 'SofiaPro-Regular',
                    size: 11,
                    color: Color(0xFF94989e),
                  ),
                  const CustomText(
                    text: "masudur.rahman@sslwireless.com",
                    family: 'SofiaPro-Medium',
                    size: 14,
                    color: Color(0xFF000000),
                  ),
                  const SizedBox(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Compony",
                        family: 'SofiaPro-Regular',
                        size: 11,
                        color: Color(0xFF94989e),
                      ),
                      CustomText(
                        text: "SSL Wireless",
                        family: 'SofiaPro-Medium',
                        size: 14,
                        color: Color(0xFF000000),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Employee ID",
                        family: 'SofiaPro-Regular',
                        size: 11,
                        color: Color(0xFF94989e),
                      ),
                      CustomText(
                        text: "1260",
                        family: 'SofiaPro-Medium',
                        size: 14,
                        color: Color(0xFF000000),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                      const CustomText(
                        text: "Department",
                        family: 'SofiaPro-Regular',
                        size: 11,
                        color: Color(0xFF94989e),
                      ),
                      CustomText(
                        text: userdetails.prof ?? "",
                        family: 'SofiaPro-Medium',
                        size: 14,
                        color: Color(0xFF000000),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Designation",
                        family: 'SofiaPro-Regular',
                        size: 11,
                        color: Color(0xFF94989e),
                      ),
                      CustomText(
                        text: "Assistant Manager",
                        family: 'SofiaPro-Medium',
                        size: 14,
                        color: Color(0xFF000000),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    decoration: const BoxDecoration(
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
