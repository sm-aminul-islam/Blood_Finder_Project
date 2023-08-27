import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final List<String> gender = ["Male", "Female"];

  int seletedview = 0;

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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Color(0xFF000000),
                )),
            bottom: const TabBar(
                labelStyle:
                    TextStyle(fontFamily: "SofiaPro-SemiBold", fontSize: 12),
                unselectedLabelColor: Color(0xFFadadad),
                labelColor: Color(0xFFd1001c),
                indicatorColor: Color(0xFFd1001c),
                tabs: [
                  Tab(
                    text: "BLOOD GROUP",
                  ),
                  Tab(text: "COMPANY"),
                  Tab(text: "GENDER"),
                ]),
            title: const Text(
              "Filter by",
              style: TextStyle(
                  fontFamily: "SofiaPro-SemiBold",
                  fontSize: 18,
                  color: Color(0xFF000000)),
            ),
            backgroundColor: const Color(0xFFf5f5f5),
          ),
          body: TabBarView(children: [
            //for BloodGroup Tabview that work default when Filter tab open
            Column(
              children: [
                Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 34,
                                  mainAxisSpacing: 40),
                          itemCount: bloodList.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  seletedview = index;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: (seletedview == index)
                                        ? Color(0xFFd1001c)
                                        : Color(0xFFffffff),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xFFe6e6e6), width: 0.5)),
                                child: Center(
                                  child: Text(
                                    bloodList[index],
                                    style: TextStyle(
                                        fontFamily: "SofiaPro-SemiBold",
                                        fontSize: 18,
                                        color: (seletedview == index)
                                            ? Color(0xFFffffff)
                                            : Color(0xFF686d78)),
                                  ),
                                ),
                              ),
                            );
                          })),
                ),
              ],
            ),

            //For Company TabView
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: companyName.length,
                itemBuilder: (context, index) => ExpansionTile(
                  tilePadding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                    width: 5,
                    color: Color(0xFFe6e6e6),
                  )),
                  leading: GestureDetector(
                    onTap: () {
                      setState(() {
                        seletedview = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: const Color(0xFFadadad))),
                      child: (seletedview == index)
                          ? SvgPicture.asset(
                              "assets/images/radioButtonCl.svg",
                              height: 25,
                              width: 25,
                            )
                          : SvgPicture.asset(
                              "assets/images/radioButton.svg",
                              height: 25,
                              width: 25,
                            ),
                    ),
                  ),
                  title: Text(
                    companyName[index],
                    style: const TextStyle(
                      fontFamily: "SofiaPro-Medium",
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                  children: [
                    Container(
                      height: 261,
                      child: ListView.builder(
                          itemCount: department.length,
                          itemBuilder: (context, index) => ListTile(
                                contentPadding: EdgeInsets.all(10),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                  width: 0.5,
                                  color: Color(0xFFe6e6e6),
                                )),
                                leading: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seletedview = index;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: const Color(0xFFadadad))),
                                    child: (seletedview == index)
                                        ? SvgPicture.asset(
                                            "assets/images/radioButtonCl.svg",
                                            height: 25,
                                            width: 25,
                                          )
                                        : SvgPicture.asset(
                                            "assets/images/radioButton.svg",
                                            height: 25,
                                            width: 25,
                                          ),
                                  ),
                                ),
                                title: Text(
                                  department[index],
                                  style: const TextStyle(
                                    fontFamily: "SofiaPro-Medium",
                                    fontSize: 14,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ),

            // For Gender Tabview

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: gender.length,
                  itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                          width: 0.5,
                          color: Color(0xFFe6e6e6),
                        )),
                        leading: GestureDetector(
                          onTap: () {
                            setState(() {
                              seletedview = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: const Color(0xFFadadad))),
                            child: (seletedview == index)
                                ? SvgPicture.asset(
                                    "assets/images/radioButtonCl.svg",
                                    height: 23,
                                    width: 23,
                                  )
                                : SvgPicture.asset(
                                    "assets/images/radioButton.svg",
                                    height: 25,
                                    width: 25,
                                  ),
                          ),
                        ),
                        title: Text(
                          gender[index],
                          style: const TextStyle(
                            fontFamily: "SofiaPro-Medium",
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      )),
            ),
          ]),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 100,
              decoration: BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.1),
                  offset: Offset(0, 0),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ]),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    color: Color(0xFFd1001c),
                    child: Center(
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                            fontFamily: "SofiaPro-bold",
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Color(0xffffffff)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
