import 'dart:convert';
import 'dart:developer';

import 'package:blood_finder/modules/Dashboard/Model/bloodgroupModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final controller = ChangeNotifierProvider((ref) => BloodController());

class BloodController with ChangeNotifier {
  BloodController() {
    loadJson();
  }

  GroupModel data = GroupModel();
  List<Person> showdata = [];

  int selected = 0;

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
  void setBloodGroupList(int index) {
    selected = index;
  }

  directcall() async {
    await FlutterPhoneDirectCaller.callNumber("01750113702");
  }

  Future<void> loadJson() async {
    final String jsonString =
        await rootBundle.loadString("assets/Json/blood.json");

    data = bloodGroupModelFromMap(jsonString);

    jsonDecode(jsonString);
    showdata = data.all ?? [];

    notifyListeners();
  }

  Future<void> saveLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? currentLang = await prefs.getInt('language');
    await prefs.setInt('language', (currentLang == 1) ? 2 : 1);

    WidgetsBinding.instance.reassembleApplication();
    notifyListeners();
  }

  void filterBloodGroup() {
    switch (selected) {
      case 0:
        {
          showdata = data.all ?? [];
        }
        break;

      case 1:
        {
          showdata = data.Apos ?? [];
        }
        break;
      case 2:
        {
          showdata = data.Opos ?? [];
        }
        break;
      case 3:
        {
          showdata = data.Bpos ?? [];
        }
        break;
      case 4:
        {
          showdata = data.ABpos ?? [];
        }
        break;
      case 5:
        {
          showdata = data.Aneg ?? [];
        }
        break;
      case 6:
        {
          showdata = data.Oneg ?? [];
        }
        break;
      case 7:
        {
          showdata = data.Bneg ?? [];
        }
      case 8:
        {
          showdata = data.ABneg ?? [];
        }
        break;
      default:
        {
          showdata = data.all ?? [];
        }
    }
    notifyListeners();
  }

  void filterProfAndBloodGroup() {
    notifyListeners();
  }
}
