import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/provider.dart';
import 'package:islami_app/modules/quran/quran_screen.dart';
import 'package:islami_app/modules/radio/radio_screen.dart';
import 'package:islami_app/modules/sebha/sebha_screen.dart';
import 'package:islami_app/modules/setting/setting_screen.dart';
import 'package:islami_app/modules/sora_screen.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

import 'modules/ahadeth/ahadeth_screen.dart';
import 'modules/ahadeth_details_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
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
