import 'package:blood_finder/modules/customwidget/constwidget/constValue.dart';
import 'package:blood_finder/modules/customwidget/customtext/customText.dart';
import 'package:flutter/material.dart';

class CustomGenderTabViews extends StatefulWidget {
  const CustomGenderTabViews({super.key});

  @override
  State<CustomGenderTabViews> createState() => _CustomGenderTabViewsState();
}

class _CustomGenderTabViewsState extends State<CustomGenderTabViews> {
  final List<String> gender = ["Male", "Female"];
  int genderselect = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: gender.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(
              () {
                genderselect = index;
              },
            );
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            shape: const Border(
              bottom: BorderSide(
                width: 0.5,
                color: Color(0xffe6e6e6),
              ),
            ),
            leading: Container(
                decoration: CustomDecoration.boxDecoration,
                child: (genderselect == index)
                    ? CustomSVgwithColor.svgcl
                    : CustomSvgwithoutCl.svg),
            title: CustomText(
                text: gender[index],
                family: "SofiaPro-Medium",
                size: 14,
                color: const Color(0xff000000)),
          ),
        ),
      ),
    );
  }
}
