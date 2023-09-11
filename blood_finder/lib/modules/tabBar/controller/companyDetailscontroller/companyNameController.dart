import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final companyProvider = ChangeNotifierProvider((ref) => CompanyName());

class CompanyName with ChangeNotifier {
  int selectCompanyName = 0;
  int selectdept = 0;

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

  bool isExpanded = false;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void setCompanyName(int index) {
    selectCompanyName = index;
    notifyListeners();
  }

  void setDepartmentName(int index) {
    selectdept = index;
    notifyListeners();
  }
}
