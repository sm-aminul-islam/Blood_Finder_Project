import 'package:blood_finder/modules/customwidget/constwidget/constValue.dart';
import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:blood_finder/modules/tabBar/controller/companyDetailscontroller/companyNameController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCompanyNameTabview extends StatelessWidget {
  const CustomCompanyNameTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Consumer(builder: (context, ref, child) {
        final company = ref.read(companyProvider.notifier);
        return ListView.builder(
          itemCount: company.companyName.length,
          itemBuilder: (context, index) => Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Color(0xffe6e6e6),
                ),
              ),
            ),
            child: Consumer(
              builder: (context, ref, child) {
                return ExpansionTile(
                  tilePadding: const EdgeInsets.all(10),
                  leading: GestureDetector(
                    onTap: () {
                      company.setCompanyName(index);
                    },
                    child: Container(
                      decoration: CustomDecoration.boxDecoration,
                      child: (ref.watch(companyProvider).selectCompanyName ==
                              index)
                          ? CustomSVgwithColor.svgcl
                          : CustomSvgwithoutCl.svg,
                    ),
                  ),
                  title: CustomText(
                    text: company.companyName[index],
                    fontWeight: FontWeight.w500,
                    size: 14,
                    color: const Color(0xFF000000),
                  ),
                  children: [
                    Container(
                      height: 261,
                      color: const Color(0xfff5f5f5),
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
                                    fontWeight: FontWeight.w400,
                                    size: 11,
                                    color: Color(0xffadb1b2),
                                  ),
                                ),
                              ),
                              Consumer(
                                builder: (context, ref, child) {
                                  final dept = ref
                                      .read(companyProvider.notifier)
                                      .department;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: dept.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(companyProvider.notifier)
                                            .setDepartmentName(index);
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
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          leading: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  strokeAlign: BorderSide
                                                      .strokeAlignCenter,
                                                  color:
                                                      const Color(0xFFadadad),
                                                ),
                                              ),
                                              child: (ref
                                                          .watch(
                                                              companyProvider)
                                                          .selectdept ==
                                                      index)
                                                  ? CustomSVgwithColor.svgcl
                                                  : CustomSvgwithoutCl.svg),
                                          title: CustomText(
                                            text: dept[index],
                                            fontWeight: FontWeight.w400,
                                            size: 12,
                                            color: (ref
                                                        .watch(companyProvider)
                                                        .selectdept ==
                                                    index)
                                                ? const Color(0xFF000000)
                                                : const Color(0xff808283),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
    ;
  }
}
