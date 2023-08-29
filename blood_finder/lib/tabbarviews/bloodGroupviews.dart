import 'package:blood_finder/const/customText.dart';
import 'package:flutter/material.dart';

class CustomBloodGroupViews extends StatefulWidget {
  const CustomBloodGroupViews({super.key});

  @override
  State<CustomBloodGroupViews> createState() => _CustomBloodGroupViewsState();
}

class _CustomBloodGroupViewsState extends State<CustomBloodGroupViews> {
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

  int bloodselect = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 34, mainAxisSpacing: 40),
              itemCount: bloodList.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        bloodselect = index;
                      },
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: (bloodselect == index)
                          ? Color(0xFFd1001c)
                          : Color(0xFFffffff),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFFe6e6e6), width: 0.5),
                    ),
                    child: Center(
                      child: CustomText(
                        text: bloodList[index],
                        family: "SofiaPro-SemiBold",
                        size: 18,
                        color: (bloodselect == index)
                            ? Color(0xFFffffff)
                            : Color(0xFF686d78),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
