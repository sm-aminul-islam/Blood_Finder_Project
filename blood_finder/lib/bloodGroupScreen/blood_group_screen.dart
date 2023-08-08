import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BloodGroupIdentify extends StatefulWidget {
  const BloodGroupIdentify({super.key});

  @override
  State<BloodGroupIdentify> createState() => _BloodGroupIdentifyState();
}

class _BloodGroupIdentifyState extends State<BloodGroupIdentify> {
  final List<Map<String, dynamic>> _allgroup = [
    {'B_group': 'O+', "Name": "Mohammad Masudur Rahman", "Prof": "Engineering"},
    {
      'B_group': 'O+',
      "Name": "Arafat Hossain",
      "Prof": "Digital Communication"
    },
    {'B_group': 'O+', "Name": "Mostaque Ahmed", "Prof": "Network & System"},
    {'B_group': 'O+', "Name": "G.M.Nayem Hossain", "Prof": "Engineering"},
    {'B_group': 'O+', "Name": "Md.Nuru Mia", "Prof": "Admin"},
    {'B_group': 'O+', "Name": "Fatema Noor Nazmoon", "Prof": "Human Resources"},
    {'B_group': 'O+', "Name": "Md. Sharif Uddin", "Prof": "Admin"},
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
    {
      'B_group': 'B+',
      "Name": "Md.Iftekhar Alam Ishaque",
      "Prof": "Engineering"
    },
  ];

  final List<String> _bloodGroup = [
    "A+",
    "O+",
    "B+",
    "AB+",
    "A-",
    "O-",
    "B-",
    "AB-"
  ];

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
                      const Text(
                        "BLOOD FINDER",
                        style: TextStyle(
                            fontFamily: 'SofiaPro-bold',
                            color: Color(0xFFffffff),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      SvgPicture.asset(
                        'assets/images/filter_variant.svg',
                        height: 12,
                        width: 18,
                      ),
                      const Text(
                        "FILTERS",
                        style: TextStyle(
                          fontFamily: 'SofiaPro-SemiBold',
                          fontSize: 14,
                          color: Color(0xFFffffff),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 21),
                Expanded(
                    child: ListView.builder(
                        itemCount: _allgroup.length,
                        itemBuilder: (context, index) => Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(color: Color(0xFFe6e6e6)),
                              )),
                              child: ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xFFe6e6e6)),
                                      shape: BoxShape.circle),
                                  child: Text(
                                    _allgroup[index]["B_group"],
                                    style: const TextStyle(
                                      fontFamily: "SofiaPro-bold",
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _allgroup[index]["Name"],
                                  style: const TextStyle(
                                      fontFamily: 'SofiaPro-Medium',
                                      fontSize: 13,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  _allgroup[index]["Prof"],
                                  style: const TextStyle(
                                      color: Color(0xFF94989e), fontSize: 11),
                                ),
                                trailing: CircleAvatar(
                                  backgroundColor: const Color(0xFFf5f5f5),
                                  child: SvgPicture.asset(
                                    'assets/images/phone-Icon.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )))
              ],
            ),
            Positioned(
              top: 85,
              left: 22,
              child: Container(
                height: 60,
                width: 390,
                decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF000000),
                        blurRadius: 15,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _bloodGroup.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(245, 245, 245, 1)),
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFf5f5f5),
                                    offset: Offset(0, 2))
                              ]),
                          child: Center(
                            child: Text(
                              _bloodGroup[index],
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro-bold',
                                  fontSize: 14,
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
