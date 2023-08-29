import 'package:blood_finder/const/constValue.dart';
import 'package:blood_finder/const/customText.dart';
import 'package:flutter/material.dart';

class CustomCompanyTabview extends StatefulWidget {
  const CustomCompanyTabview({super.key});

  @override
  State<CustomCompanyTabview> createState() => _CustomCompanyTabviewState();
}

class _CustomCompanyTabviewState extends State<CustomCompanyTabview> {
  final List<String> companyName = [
    "Concorde Garments Ltd.",
    "Biddyut Ltd.",
    "SSL Wireless",
    "Lily Apparels Ltd",
    "Osman Interlinings Ltd."
  ];

  final List<String> department = [
    "Head of Business Grow",
    "Accounts & Finance",
    "Customer Care",
    "Human Resources",
    "Operations",
  ];
  int deptselect = 0;

  int companyNameselect = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: companyName.length,
        itemBuilder: (context, index) => Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffe6e6e6),
              ),
            ),
          ),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.all(10),
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  companyNameselect = index;
                });
              },
              child: Container(
                decoration: CustomDecoration.boxDecoration,
                child: (companyNameselect == index)
                    ? CustomSVgwithColor.svgcl
                    : CustomSvgwithoutCl.svg,
              ),
            ),
            title: CustomText(
              text: companyName[index],
              family: "SofiaPro-Medium",
              size: 14,
              color: const Color(0xFF000000),
            ),
            children: [
              Container(
                height: 261,
                color: Color(0xfff5f5f5),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "Select Department",
                              family: "SofiaPro-Regular",
                              size: 11,
                              color: Color(0xffadb1b2),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: department.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  deptselect = index;
                                },
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 0.5,
                                    color: Color(0xffe4e4e4),
                                  ),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(5),
                                leading: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: const Color(0xFFadadad),
                                      ),
                                    ),
                                    child: (deptselect == index)
                                        ? CustomSVgwithColor.svgcl
                                        : CustomSvgwithoutCl.svg),
                                title: CustomText(
                                  text: department[index],
                                  family: "SofiaPro-Medium",
                                  size: 12,
                                  color: (deptselect == index)
                                      ? const Color(0xFF000000)
                                      : const Color(0xff808283),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
