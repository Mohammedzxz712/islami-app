import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/models/model_theme_mode.dart';
import 'package:islami_app/modules/quran/quran_screen.dart';
import 'package:islami_app/modules/radio/radio_screen.dart';
import 'package:islami_app/modules/sebha/sebha_screen.dart';
import 'package:islami_app/modules/setting/setting_screen.dart';

import '../../generated/assets.dart';
import '../ahadeth/ahadeth_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    AhadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (MyThemeMode.isDark == false)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesDefaultBg, fit: BoxFit.cover),
          ),
        if (MyThemeMode.isDark)
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesBg, fit: BoxFit.cover),
          ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconQuran),
                  ),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconHadeth),
                  ),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconSebha),
                  ),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconRadio),
                  ),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: screens[currentIndex],
        ),
      ],
    );
  }
}
