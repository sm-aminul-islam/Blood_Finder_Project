import 'package:blood_finder/modules/filterScreen/view/donarfilterScreen.dart';
import 'package:blood_finder/modules/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ProviderScope(
      child: (MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int lang = 1;

  @override
  Widget build(BuildContext context) {
    getLanguagePreference();
    return MaterialApp(
      title: 'Blood Finder',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: lang == 1 ? const Locale("en") : const Locale("bn"),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Sofia',
      ),
      debugShowCheckedModeBanner: false,
      home: BFSScreen(),
      //DonarFilterScreen(),
    );
  }

  getLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("value: ${prefs.getInt('language') ?? 1}");
    lang = await prefs.getInt('language') ?? 1;
  }
}
