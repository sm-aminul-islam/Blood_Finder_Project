import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodGroupController with ChangeNotifier {
  int bloodselct = 0;
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

  void setbloodGroup(int index) {
    bloodselct = index;
    notifyListeners();
  }
}

final bloodgroup = ChangeNotifierProvider((ref) => BloodGroupController());
