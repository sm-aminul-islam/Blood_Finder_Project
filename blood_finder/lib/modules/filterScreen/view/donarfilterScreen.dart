import 'package:blood_finder/modules/Dashboard/Controller/changeNotifierBloodGroup.dart';
import 'package:blood_finder/modules/customwidget/constwidget/constValue.dart';
import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:blood_finder/modules/filterScreen/view/filterScreen.dart';
import 'package:blood_finder/modules/tabBar/controller/bloodGroupcontroller/bloodGroupController.dart';
import 'package:blood_finder/modules/tabBar/controller/companyDetailscontroller/companyNameController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../dashboard/view/deatilspageview/details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonarFilterScreen extends StatelessWidget {
  const DonarFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffd1001c),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: const Color(0xffffffff),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              height: 80,
              width: double.infinity,
              color: const Color(0xFFd1001c),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomText(
                    text: "Blood Finder",
                    fontWeight: FontWeight.w700,
                    size: 16,
                    color: const Color(0xFFffffff),
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
            const SizedBox(height: 10),
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
                      tileColor: Color(0xffffffff),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              userdetails:
                                  changeBloodGroupController.showdata[index],
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
                        text: changeBloodGroupController.showdata[index].name ??
                            "",
                        fontWeight: FontWeight.w500,
                        size: 13,
                        color: const Color(0xFF000000),
                      ),

                      subtitle: CustomText(
                        text: changeBloodGroupController.showdata[index].prof ??
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(5),
          height: 60,
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 26,
                  width: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xffededed),
                  ),
                  child: Consumer(builder: (context, WidgetRef ref, child) {
                    final BloodController = ref.watch(bloodgroup);
                    return Center(
                      child: Text(
                        BloodController.bloodList[BloodController.bloodselct],
                        style: CustomTextstyle.txt,
                      ),
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xffededed),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) => Center(
                      child: Text(
                        ref.watch(companyProvider).companyName[
                            ref.watch(companyProvider).selectCompanyName],
                        style: CustomTextstyle.txt,
                      ),
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
                  child: Consumer(
                    builder: (context, ref, child) => Center(
                      child: Text(
                        ref
                            .watch(companyProvider)
                            .department[ref.watch(companyProvider).selectdept],
                        style: CustomTextstyle.txt,
                      ),
                    ),
                  ),
                ),
                const CustomText(
                  text: "CLEAR",
                  color: Color(0xffd1001c),
                  size: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.86,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
