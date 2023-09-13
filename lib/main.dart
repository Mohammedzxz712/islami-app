import 'package:flutter/material.dart';
import 'package:islami_app/models/model_theme_mode.dart';
import 'package:islami_app/modules/quran/quran_screen.dart';
import 'package:islami_app/modules/radio/radio_screen.dart';
import 'package:islami_app/modules/sebha/sebha_screen.dart';
import 'package:islami_app/modules/setting/setting_screen.dart';
import 'package:islami_app/modules/sora_screen.dart';
import 'package:islami_app/shared/theme_data.dart';

import 'modules/ahadeth/ahadeth_screen.dart';
import 'modules/ahadeth_details_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      themeMode: MyThemeMode.isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: MyTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        AhadethScreen.routeName: (context) => AhadethScreen(),
        QuranScreen.routeName: (context) => QuranScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
        RadioScreen.routeName: (context) => RadioScreen(),
        SebhaScreen.routeName: (context) => SebhaScreen(),
        SoraScreen.routeName: (context) => SoraScreen(),
        AhadethDetailsScreen.routeName: (context) => AhadethDetailsScreen(),
      },
    );
  }
}
