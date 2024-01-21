import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../generated/assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(Assets.imagesIconQuran),
            ),
            label: AppLocalizations.of(context)!.quran),
        BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(Assets.imagesIconHadeth),
            ),
            label: AppLocalizations.of(context)!.hadeth),
        BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(Assets.imagesIconSebha),
            ),
            label: AppLocalizations.of(context)!.sebha),
        BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage(Assets.imagesIconRadio),
            ),
            label: AppLocalizations.of(context)!.radio),
        BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings),
      ],
    );
  }
}
