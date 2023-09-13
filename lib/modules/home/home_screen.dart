import 'package:flutter/material.dart';
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
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconQuran),
                  ),
                  label: 'القران'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconHadeth),
                  ),
                  label: 'الاحاديث'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconSebha),
                  ),
                  label: 'سبحه'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(Assets.imagesIconRadio),
                  ),
                  label: 'راديو'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'اعدادات'),
            ],
          ),
          appBar: AppBar(
            title: Text(
              'إسلامي',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: screens[currentIndex],
        ),
      ],
    );
  }
}
