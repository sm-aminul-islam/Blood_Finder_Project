import 'package:blood_finder/modules/Dashboard/Controller/changeNotifierBloodGroup.dart';
import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:blood_finder/modules/dashboard/view/deatilspageview/details_screen.dart';
import 'package:blood_finder/modules/filterScreen/view/filterScreen.dart';
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
                                .read(controller.notifier)
                                .saveLanguagePreference();
                          },
                          child: CustomText(
                            text: AppLocalizations.of(context)!.title,
                            fontWeight: FontWeight.w700,
                            size: 16,
                            color: const Color(0xFFffffff),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FilterScreen(),
                            ),
                          );
                        },
                        child: const CustomText(
                          text: "FILTERS",
                          size: 14,
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final changeBloodGroupController = ref.watch(controller);

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
                              shape: BoxShape.circle,
                            ),
                            child: CustomText(
                              text: changeBloodGroupController
                                      .showdata[index].bgroup ??
                                  " ",
                              fontWeight: FontWeight.w700,
                              size: 14,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          title: CustomText(
                            text: changeBloodGroupController
                                    .showdata[index].name ??
                                "",
                            fontWeight: FontWeight.w500,
                            size: 13,
                            color: const Color(0xFF000000),
                          ),

                          subtitle: CustomText(
                            text: changeBloodGroupController
                                    .showdata[index].prof ??
                                " ",
                            size: 11,
                            color: const Color(0xFF94989e),
                            fontWeight: FontWeight.w400,
                          ),

                          // //For call
                          trailing: InkWell(
                            onTap: () {
                              ref.read(controller.notifier).directcall();
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
                  final changeBloodlistControlller = ref.watch(controller);
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
                                (changeBloodlistControlller.selected == index)
                                    ? const Color(0xFFd1001c)
                                    : const Color(0xFFf5f5f5),
                            border: Border.all(
                              width: 0.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomText(
                              text: changeBloodlistControlller
                                  .bloodGroupList[index],
                              fontWeight: FontWeight.w700,
                              size: 14,
                              color:
                                  (changeBloodlistControlller.selected == index)
                                      ? const Color(0xFFf5f5f5)
                                      : Color(0xFF000000),
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
  }
}
