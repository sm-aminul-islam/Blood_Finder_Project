import 'dart:convert';

BloodGroupModel bloodGroupModelFromMap(String str) =>
    BloodGroupModel.fromMap(json.decode(str));

String bloodGroupModelToMap(BloodGroupModel data) => json.encode(data.toMap());

class BloodGroupModel {
  List<A>? all;
  List<A>? a;
  List<A>? bloodGroupModelA;
  List<A>? b;
  List<A>? bloodGroupModelB;
  List<A>? o;
  List<A>? bloodGroupModelO;
  List<A>? ab;
  List<A>? bloodGroupModelAb;

  BloodGroupModel({
    this.all,
    this.a,
    this.bloodGroupModelA,
    this.b,
    this.bloodGroupModelB,
    this.o,
    this.bloodGroupModelO,
    this.ab,
    this.bloodGroupModelAb,
  });

  factory BloodGroupModel.fromMap(Map<String, dynamic> json) => BloodGroupModel(
        all: json["All"] == null
            ? []
            : List<A>.from(json["All"]!.map((x) => A.fromMap(x))),
        a: json["A+"] == null
            ? []
            : List<A>.from(json["A+"]!.map((x) => A.fromMap(x))),
        bloodGroupModelA: json["A-"] == null
            ? []
            : List<A>.from(json["A-"]!.map((x) => A.fromMap(x))),
        b: json["B+"] == null
            ? []
            : List<A>.from(json["B+"]!.map((x) => A.fromMap(x))),
        bloodGroupModelB: json["B-"] == null
            ? []
            : List<A>.from(json["B-"]!.map((x) => A.fromMap(x))),
        o: json["O+"] == null
            ? []
            : List<A>.from(json["O+"]!.map((x) => A.fromMap(x))),
        bloodGroupModelO: json["O-"] == null
            ? []
            : List<A>.from(json["O-"]!.map((x) => A.fromMap(x))),
        ab: json["AB+"] == null
            ? []
            : List<A>.from(json["AB+"]!.map((x) => A.fromMap(x))),
        bloodGroupModelAb: json["AB-"] == null
            ? []
            : List<A>.from(json["AB-"]!.map((x) => A.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "All":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toMap())),
        "A+": a == null ? [] : List<dynamic>.from(a!.map((x) => x.toMap())),
        "A-": bloodGroupModelA == null
            ? []
            : List<dynamic>.from(bloodGroupModelA!.map((x) => x.toMap())),
        "B+": b == null ? [] : List<dynamic>.from(b!.map((x) => x.toMap())),
        "B-": bloodGroupModelB == null
            ? []
            : List<dynamic>.from(bloodGroupModelB!.map((x) => x.toMap())),
        "O+": o == null ? [] : List<dynamic>.from(o!.map((x) => x.toMap())),
        "O-": bloodGroupModelO == null
            ? []
            : List<dynamic>.from(bloodGroupModelO!.map((x) => x.toMap())),
        "AB+": ab == null ? [] : List<dynamic>.from(ab!.map((x) => x.toMap())),
        "AB-": bloodGroupModelAb == null
            ? []
            : List<dynamic>.from(bloodGroupModelAb!.map((x) => x.toMap())),
      };
}

class A {
  String? bGroup;
  String? name;
  String? prof;

  A({
    this.bGroup,
    this.name,
    this.prof,
  });

  factory A.fromMap(Map<String, dynamic> json) => A(
        bGroup: json["B_group"],
        name: json["Name"],
        prof: json["Prof"],
      );

  Map<String, dynamic> toMap() => {
        "B_group": bGroup,
        "Name": name,
        "Prof": prof,
      };
}
