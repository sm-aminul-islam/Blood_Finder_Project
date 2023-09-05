import 'dart:developer';

import 'package:blood_finder/bloodGroupScreen/blood_group_screen.dart';
import 'package:blood_finder/bloodGroupScreen/changeNotifierBloodGroup.dart';
import 'package:blood_finder/bloodGroupScreen/details_screen.dart';
import 'package:blood_finder/bloodGroupScreen/filterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class BloodScreen extends StatelessWidget {
  const BloodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  height: 120,
                  width: double.infinity,
                  color: const Color(0xFFd1001c),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Changing Language
                      Consumer(
                        builder: (context, ref, child) => GestureDetector(
                          onTap: () {
                            ref
                                .read(notifyBloodmodel.notifier)
                                .saveLanguagePreference();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.title,
                            style: const TextStyle(
                                fontFamily: 'SofiaPro-bold',
                                color: Color(0xFFffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      SvgPicture.asset(
                        'assets/images/filter_variant.svg',
                        height: 12,
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilterScreen()));
                        },
                        child: const Text(
                          "FILTERS",
                          style: TextStyle(
                            fontFamily: 'SofiaPro-SemiBold',
                            fontSize: 14,
                            color: Color(0xFFffffff),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final changeBloodGroupController =
                        ref.watch(notifyBloodmodel);
                    print(changeBloodGroupController.showdata);

                    return ListView.builder(
                      itemCount: changeBloodGroupController.showdata.length,
                      itemBuilder: (context, index) => Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Color(0xFFe6e6e6)),
                        )),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  userdetails: changeBloodGroupController
                                      .showdata[index],
                                ),
                              ),
                            );
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: const Color(0xFFe6e6e6)),
                                shape: BoxShape.circle),
                            child: Text(
                              changeBloodGroupController
                                      .showdata[index].bgroup ??
                                  " ",
                              style: const TextStyle(
                                fontFamily: "SofiaPro-bold",
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          title: Text(
                            changeBloodGroupController.showdata[index].name ??
                                "",
                            style: const TextStyle(
                                fontFamily: 'SofiaPro-Medium',
                                fontSize: 13,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            changeBloodGroupController.showdata[index].prof ??
                                "",
                            style: const TextStyle(
                                color: Color(0xFF94989e), fontSize: 11),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              ref.read(notifyBloodmodel.notifier).directcall();
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFf5f5f5),
                              child: SvgPicture.asset(
                                'assets/images/phone-Icon.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Positioned(
              top: 85,
              left: 15,
              child: Container(
                padding: const EdgeInsets.only(right: 20, left: 15),
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.12),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Consumer(builder: (context, ref, child) {
                  final changeBloodlistControlller =
                      ref.read(notifyBloodmodel.notifier);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: changeBloodlistControlller.bloodGroupList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          changeBloodlistControlller.selected = index;
                          changeBloodlistControlller.filterBloodGroup();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                (ref.watch(notifyBloodmodel).selected == index)
                                    ? const Color(0xFFd1001c)
                                    : const Color(0xFFf5f5f5),
                            border: Border.all(
                              width: 0.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              changeBloodlistControlller.bloodGroupList[index],
                              style: TextStyle(
                                fontFamily: "SofiaPro-bold",
                                fontSize: 14,
                                color: (changeBloodlistControlller.selected ==
                                        index)
                                    ? const Color(0xFFf5f5f5)
                                    : Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
