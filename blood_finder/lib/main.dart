import 'package:blood_finder/bloodGroupScreen/filterScreen.dart';
import 'package:blood_finder/splashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int lang = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getLanguagePreference();
    return MaterialApp(
      title: 'Blood Finder',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: lang == 1 ? Locale("en") : Locale("bn"),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'SofiaPro-bold',
      ),
      debugShowCheckedModeBanner: false,
      home: FilterScreen(),
      // BFSScreen(),
    );
  }

  getLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("value: ${prefs.getInt('language') ?? 1}");
    lang = await prefs.getInt('language') ?? 1;
  }
}
