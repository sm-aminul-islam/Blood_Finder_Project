import 'dart:ffi';

import 'package:flutter/material.dart';

class BloodGroupController with ChangeNotifier {
  String? name;
  int? _age;

  void nameInit(String wr) {
    this.name = name;
  }

  void setAge(int age) {
    _age = age;
  }

  String getName() {
    setAge(10);
    return _name!;
  }

  int getAge() {
    return _age!;
  }
}
