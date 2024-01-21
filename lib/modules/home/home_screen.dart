import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/home/custom_bottom_nav.dart';
import 'package:islami_app/modules/provider.dart';
import 'package:islami_app/modules/quran/quran_screen.dart';
import 'package:islami_app/modules/radio/radio_screen.dart';
import 'package:islami_app/modules/sebha/sebha_screen.dart';
import 'package:islami_app/modules/setting/setting_screen.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../ahadeth/ahadeth_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    AhadethScreen(),
    SebhaScreen(),
    const RadioScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        if (provider.isDark == false)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesDefaultBg, fit: BoxFit.cover),
          ),
        if (provider.isDark)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Assets.imagesBg, fit: BoxFit.cover),
          ),
        Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
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
