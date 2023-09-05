import 'dart:convert';
import 'dart:developer';

import 'package:blood_finder/modules/dashboard/View/deatilspageview/details_screen.dart';
import 'package:blood_finder/modules/dashboard/View/filterScreen/filterScreen.dart';
import 'package:blood_finder/modules/Dashboard/Model/bloodgroupModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodGroupIdentify extends StatefulWidget {
  BloodGroupIdentify({
    super.key,
  });

  @override
  State<BloodGroupIdentify> createState() => _BloodGroupIdentifyState();
}

class _BloodGroupIdentifyState extends State<BloodGroupIdentify> {
  List<Person> showData = [];

  List<String> bloodGroupList = [
    "All",
    "A+",
    "O+",
    "B+",
    "AB+",
    "A-",
    "O-",
    "B-",
    "AB-"
  ];
  GroupModel data = GroupModel();
// Load Json
  Future<void> loadJson() async {
    final String jsonString =
        await rootBundle.loadString("assets/Json/blood.json");

    data = bloodGroupModelFromMap(jsonString);

    jsonDecode(jsonString);

    setState(() {
      showData = data.all ?? [];
    });
  }

  @override
  void initState() {
    loadJson();
  }

  int selected = 0;

  directcall() async {
    await FlutterPhoneDirectCaller.callNumber("01750113702");
  }

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
                      GestureDetector(
                        onTap: () {
                          saveLanguagePreference();
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
                        child: Text(
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
                  child: ListView.builder(
                    itemCount: showData.length,
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
                                        userdetails: showData[index],
                                      )));
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: const Color(0xFFe6e6e6)),
                              shape: BoxShape.circle),
                          child: Text(
                            showData[index].bgroup ?? "",
                            style: const TextStyle(
                              fontFamily: "SofiaPro-bold",
                              fontSize: 14,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        title: Text(
                          showData[index].name ?? "",
                          style: const TextStyle(
                              fontFamily: 'SofiaPro-Medium',
                              fontSize: 13,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          showData[index].prof ?? "",
                          style: const TextStyle(
                              color: Color(0xFF94989e), fontSize: 11),
                        ),
                        trailing: InkWell(
                          onTap: directcall,
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
                  ),
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
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bloodGroupList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                            filterBloodGroup();
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (selected == index)
                                ? const Color(0xFFd1001c)
                                : const Color(0xFFf5f5f5),
                            border: Border.all(
                              width: 0.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              bloodGroupList[index],
                              style: TextStyle(
                                fontFamily: "SofiaPro-bold",
                                fontSize: 14,
                                color: (selected == index)
                                    ? const Color(0xFFf5f5f5)
                                    : Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterBloodGroup() {
    //print("test :: ${data.toMap().keys.contains(bloodGroupList[index])}");

    // final key = data.toMap().

    //print(key);
    // if (data.all != (bloodGroupList[selected])) {
    //  final temp = data.all?[bloodGroupList[selected]];
    //   showData = List<Person>.from(temp).toList();
    // }

    // if (data.tojson().containsKey(bloodGroupList[selected])) {
    //   showData = data.tojson()[bloodGroupList[selected]];
    // }
    // if (data.toMap().keys.contains(bloodGroupList[selected])) {
    //   showData = data.toMap()[bloodGroupList[selected]];
    //   // print(showData.toString());
    // }

    switch (selected) {
      case 0:
        {
          showData = data.all ?? [];
        }
        break;

      case 1:
        {
          showData = data.Apos ?? [];
        }
        break;
      case 2:
        {
          showData = data.Opos ?? [];
        }
        break;
      case 3:
        {
          showData = data.Bpos ?? [];
        }
        break;
      case 4:
        {
          showData = data.ABpos ?? [];
        }
        break;
      case 5:
        {
          showData = data.Aneg ?? [];
        }
        break;
      case 6:
        {
          showData = data.Oneg ?? [];
        }
        break;
      case 7:
        {
          showData = data.Bneg ?? [];
        }
      case 8:
        {
          showData = data.ABneg ?? [];
        }
        break;
      default:
        {
          showData = data.all ?? [];
        }
    }
    setState(() {});
  }

  Future<void> saveLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? currentLang = await prefs.getInt('language');
    print("before");
    print(currentLang);
    await prefs.setInt('language', (currentLang == 1) ? 2 : 1);
    print("after");
    print(prefs.getInt('language'));

    // AppLocalizations.(Locale('en', 'US'));

    WidgetsBinding.instance.reassembleApplication();
    // await prefs.setInt('language', 2);

    // (language == 1) ? Locale("en") : Locale("bn");
  }
}
