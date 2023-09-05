import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyName with ChangeNotifier {
  int selectCompanyName = 0;
  List<String> companyName = [
    "Concorde Garments Ltd.",
    "Biddyut Ltd.",
    "SSL Wireless",
    "Lily Apparels Ltd",
    "Osman Interlinings Ltd."
  ];

  List<String> department = [
    "Head of Business Grow",
    "Accounts & Finance",
    "Customer Care",
    "Human Resources",
    "Operations",
  ];
  int selectdept = 0;

  void setCompanyName(int index) {
    selectCompanyName = index;
    notifyListeners();
  }

  void setDepartmentName(int index) {
    selectdept = index;
    notifyListeners();
  }
}

final companyProvider = ChangeNotifierProvider((ref) => CompanyName());
