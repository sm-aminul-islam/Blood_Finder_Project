import 'dart:developer';
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
                                          color: Color(0xFFe6e6e6),
                                          width: 0.5)),
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
                  Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Color(0xFFffffff), boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        offset: Offset(0, 0),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 26,
                          width: 49,
                          margin: EdgeInsets.only(top: 10, left: 15),
                          decoration: BoxDecoration(
                            color: Color(0xffededed),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Text(
                              bloodList[seletedview],
                              style: TextStyle(
                                  fontFamily: "SofiaPro-Medium",
                                  fontSize: 11,
                                  color: Color(0xFF686d73)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 64,
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
                ],
              ),
              Center(child: Text("Company")),
              Center(child: Text("Gender")),
            ]),
          )),
    );
  }
}
