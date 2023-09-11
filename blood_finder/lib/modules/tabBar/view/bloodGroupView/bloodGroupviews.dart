import 'dart:developer';

import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:blood_finder/modules/tabBar/controller/bloodGroupcontroller/bloodGroupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBloodGroupView extends StatelessWidget {
  const CustomBloodGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Consumer(
              builder: (context, WidgetRef ref, child) {
                final blood = ref.read(bloodgroup.notifier);
                print(ref.watch(bloodgroup).matchBloodgroup);

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 34,
                      mainAxisSpacing: 40),
                  itemCount: blood.bloodList.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(bloodgroup.notifier).setbloodGroup(index);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: (ref.read(bloodgroup.notifier).bloodselct ==
                                  index)
                              ? const Color(0xFFd1001c)
                              : const Color(0xFFffffff),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFFe6e6e6), width: 0.5),
                        ),
                        child: Center(
                          child: CustomText(
                            text: blood.bloodList[index],
                            fontWeight: FontWeight.w600,
                            size: 18,
                            color: (ref.watch(bloodgroup).bloodselct == index)
                                ? const Color(0xFFffffff)
                                : const Color(0xFF686d78),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
    ;
  }
}
