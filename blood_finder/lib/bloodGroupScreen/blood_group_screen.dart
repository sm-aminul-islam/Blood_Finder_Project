import 'package:blood_finder/bloodGroupScreen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodGroupIdentify extends StatefulWidget {
  const BloodGroupIdentify({super.key});

  @override
  State<BloodGroupIdentify> createState() => _BloodGroupIdentifyState();
}

class _BloodGroupIdentifyState extends State<BloodGroupIdentify> {
  final List<Map<String, List<Map<String, dynamic>>>> _allgroup = [
    {
      'All': [
        {
          'B_group': 'B+',
          "Name": "Md.Iftekhar Alam Ishaque",
          "Prof": "Engineering"
        },
        {
          'B_group': 'B+',
          "Name": "S.M.Aminul Islam",
          "Prof": "Intern,Engineering"
        },
        {'B_group': 'B-', "Name": "Sabbir Arafat", "Prof": "Engineering"},
        {'B_group': 'B-', "Name": "Shanjana Faria ", "Prof": "Engineering"},
        {
          'B_group': 'O+',
          "Name": "Mohammad Masudur Rahman",
          "Prof": "Engineering"
        },
        {
          'B_group': 'A+',
          "Name": "Mohammad Mahfuz Rahman",
          "Prof": "Engineering"
        },
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Mofajjal Ahmed", "Prof": "Network & System"},
        {'B_group': 'A+', "Name": "G.M.Rifat Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md.Nurul Hasan", "Prof": "Admin"},
        {'B_group': 'A+', "Name": "Fatema Naznin", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md. Sharif JR", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md.Rakibul Hasan", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A-', "Name": "Mohammad Ali", "Prof": "Engineering"},
        {'B_group': 'A-', "Name": "Dilshad Azad", "Prof": "Engineering"},
        {'B_group': 'A-', "Name": "Moon Ahmed", "Prof": "Network & System"},
        {
          'B_group': 'O+',
          "Name": "Arafat Hossain",
          "Prof": "Digital Communication"
        },
        {'B_group': 'O+', "Name": "Mostaque Ahmed", "Prof": "Network & System"},
        {'B_group': 'O+', "Name": "G.M.Nayem Hossain", "Prof": "Engineering"},
        {'B_group': 'O+', "Name": "Md.Nuru Mia", "Prof": "Admin"},
        {
          'B_group': 'O+',
          "Name": "Fatema Noor Nazmoon",
          "Prof": "Human Resources"
        },
        {'B_group': 'O+', "Name": "Md. Sharif Uddin", "Prof": "Admin"},
        {'B_group': 'O-', "Name": "Sabrina Kaisar", "Prof": "Engineering"},
        {'B_group': 'O-', "Name": "Mehedi Hasan", "Prof": "Engineering"},
        {'B_group': 'AB+', "Name": "Saiful Islam", "Prof": "Engineering"},
        {'B_group': 'AB+', "Name": "Najim Hossain ", "Prof": "Engineering"},
        {'B_group': 'AB-', "Name": "Tahmid Arnob", "Prof": "Engineering"},
        {'B_group': 'AB-', "Name": "Pithu Roy ", "Prof": "Engineering"},
      ],
    },
    {
      'A+': [
        {
          'B_group': 'A+',
          "Name": "Mohammad Mahfuz Rahman",
          "Prof": "Engineering"
        },
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Mofajjal Ahmed", "Prof": "Network & System"},
        {'B_group': 'A+', "Name": "G.M.Rifat Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md.Nurul Hasan", "Prof": "Admin"},
        {'B_group': 'A+', "Name": "Fatema Naznin", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md. Sharif JR", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Md.Rakibul Hasan", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
        {'B_group': 'A+', "Name": "Alif Hossain", "Prof": "Engineering"},
      ],
    },
    {
      'A-': [
        {'B_group': 'A-', "Name": "Mohammad Ali", "Prof": "Engineering"},
        {'B_group': 'A-', "Name": "Dilshad Azad", "Prof": "Engineering"},
        {'B_group': 'A-', "Name": "Moon Ahmed", "Prof": "Network & System"},
      ],
    },
    {
      'B+': [
        {
          'B_group': 'B+',
          "Name": "Md.Iftekhar Alam Ishaque",
          "Prof": "Engineering"
        },
        {
          'B_group': 'B+',
          "Name": "S.M.Aminul Islam",
          "Prof": "Intern,Engineering"
        },
      ],
    },
    {
      'B-': [
        {'B_group': 'B-', "Name": "Sabbir Arafat", "Prof": "Engineering"},
        {'B_group': 'B-', "Name": "Shanjana Faria ", "Prof": "Engineering"},
      ],
    },
    {
      'O+': [
        {
          'B_group': 'O+',
          "Name": "Mohammad Masudur Rahman",
          "Prof": "Engineering"
        },
        {
          'B_group': 'O+',
          "Name": "Arafat Hossain",
          "Prof": "Digital Communication"
        },
        {'B_group': 'O+', "Name": "Mostaque Ahmed", "Prof": "Network & System"},
        {'B_group': 'O+', "Name": "G.M.Nayem Hossain", "Prof": "Engineering"},
        {'B_group': 'O+', "Name": "Md.Nuru Mia", "Prof": "Admin"},
        {
          'B_group': 'O+',
          "Name": "Fatema Noor Nazmoon",
          "Prof": "Human Resources"
        },
        {'B_group': 'O+', "Name": "Md. Sharif Uddin", "Prof": "Admin"},
      ],
    },
    {
      'O-': [
        {'B_group': 'O-', "Name": "Sabrina Kaisar", "Prof": "Engineering"},
        {'B_group': 'O-', "Name": "Mehedi Hasan", "Prof": "Engineering"},
      ],
    },
    {
      'AB+': [
        {'B_group': 'AB+', "Name": "Saiful Islam", "Prof": "Engineering"},
        {'B_group': 'AB+', "Name": "Najim Hossain ", "Prof": "Engineering"},
      ],
    },
    {
      'AB-': [
        {'B_group': 'AB-', "Name": "Tahmid Arnob", "Prof": "Engineering"},
        {'B_group': 'AB-', "Name": "Pithu Roy ", "Prof": "Engineering"},
      ],
    },
  ];

  int selected = 0;

  directcall() async {
    await FlutterPhoneDirectCaller.callNumber('01750113702');
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
                    itemCount: _allgroup[selected].values.first.length,
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
                                  builder: (context) => const DetailsScreen()));
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: const Color(0xFFe6e6e6)),
                              shape: BoxShape.circle),
                          child: Text(
                            _allgroup[selected].values.first[index]["B_group"],
                            style: const TextStyle(
                              fontFamily: "SofiaPro-bold",
                              fontSize: 14,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        title: Text(
                          _allgroup[selected].values.first[index]["Name"],
                          style: const TextStyle(
                              fontFamily: 'SofiaPro-Medium',
                              fontSize: 13,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _allgroup[selected].values.first[index]["Prof"],
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
                    itemCount: _allgroup.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
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
                              _allgroup[index].keys.first,
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
