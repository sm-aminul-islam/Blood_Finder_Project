import 'dart:convert';
import 'dart:developer';

import 'package:blood_finder/modules/dashboard/model/bloodgroupModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bloodgroup = ChangeNotifierProvider((ref) => BloodGroupController());

class BloodGroupController with ChangeNotifier {
  BloodGroupController() {
    loadJson();
  }
  int bloodselct = 0;
  GroupModel model = GroupModel();
  List<Person> matchBloodgroup = [];
  List<String> bloodList = [
    "A+",
    "O+",
    "B+",
    "AB+",
    "A-",
    "O-",
    "B-",
    "AB-",
  ];
  Future<void> loadJson() async {
    final String jsonString =
        await rootBundle.loadString("assets/Json/blood.json");

    model = bloodGroupModelFromMap(jsonString);

    jsonDecode(jsonString);
    matchBloodgroup = model.all ?? [];

    notifyListeners();
  }

  void setbloodGroup(int index) {
    bloodselct = index;
    notifyListeners();
  }

  void filterBloodGroup() {
    switch (bloodselct) {
      case 0:
        {
          matchBloodgroup = model.Apos ?? [];
        }
        break;
      case 1:
        {
          matchBloodgroup = model.Opos ?? [];
        }
        break;
      case 2:
        {
          matchBloodgroup = model.Bpos ?? [];
        }
        break;
      case 3:
        {
          matchBloodgroup = model.ABpos ?? [];
        }
        break;
      case 4:
        {
          matchBloodgroup = model.Aneg ?? [];
        }
        break;
      case 5:
        {
          matchBloodgroup = model.Oneg ?? [];
        }
        break;
      case 6:
        {
          matchBloodgroup = model.Bneg ?? [];
        }
        break;
      case 7:
        {
          matchBloodgroup = model.ABneg ?? [];
        }
        break;
    }

    notifyListeners();
  }
}
