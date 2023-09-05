import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter with ChangeNotifier {
  int count = 0;
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

  void increment() {
    count++;
    notifyListeners();
  }

  void nameInit(List<String> allbloodGrop) {
    bloodList = allbloodGrop;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

final counter = ChangeNotifierProvider((ref) {
  return Counter();
});
