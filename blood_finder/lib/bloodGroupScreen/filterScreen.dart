import 'dart:developer';
import 'package:blood_finder/const/constValue.dart';
import 'package:blood_finder/const/customText.dart';
import 'package:blood_finder/tabbarviews/bloodGroupviews.dart';
import 'package:blood_finder/tabbarviews/companyTabview.dart';
import 'package:blood_finder/tabbarviews/genderTabview.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> bloodList = [
    "A+",
    "O+",
    "B+",
    "AB+",
    "A-",
    "O-",
    "B-",
    "AB-",
  ];

  List<String> companyName = [
    "Concorde Garments Ltd.",
    "Biddyut Ltd.",
    "SSL Wireless",
    "Lily Apparels Ltd",
    "Osman Interlinings Ltd."
  ];
  List<String> department = [
    "Head of Business Grow",
    "Accounts & Finance",
    "Customer Care",
    "Human Resources",
    "Operations",
  ];
  List<String> gender = ["Male", "Female"];

  int bloodselect = 0;
  int companyNameselect = 0;
  int deptselect = 0;
  int genderselect = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xFF000000),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(
                fontFamily: "SofiaPro-SemiBold",
                fontSize: 12,
              ),
              unselectedLabelColor: Color(0xFFadadad),
              labelColor: Color(0xFFd1001c),
              indicatorColor: Color(0xFFd1001c),
              tabs: [
                Tab(
                  text: "BLOOD GROUP",
                ),
                Tab(text: "COMPANY"),
                Tab(text: "GENDER"),
              ],
            ),
            title: const CustomText(
              text: "Filter by",
              family: "SofiaPro-Semibold",
              size: 18,
              color: Color(0xFF000000),
            ),
            backgroundColor: const Color(0xFFf5f5f5),
          ),
          body: const TabBarView(
            children: [
              //for BloodGroup Tabview that work default when Filter tab open
              CustomBloodGroupViews(),

              //For Company TabView
              CustomCompanyTabview(),

              // For Gender Tabview
              CustomGenderTabViews(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 12,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 26,
                          width: 49,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Color(0xffededed),
                          ),
                          child: Center(
                            child: Text(
                              bloodList[bloodselect],
                              style: CustomTextstyle.txt,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color(0xffededed),
                          ),
                          child: Center(
                            child: Text(
                              companyName[companyNameselect],
                              style: CustomTextstyle.txt,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color(0xffededed),
                          ),
                          child: Center(
                            child: Text(
                              department[deptselect],
                              style: CustomTextstyle.txt,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xffd1001c),
                    child: const Center(
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                          fontFamily: "SofiaPro-bold",
                          fontSize: 14,
                          letterSpacing: 1,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
