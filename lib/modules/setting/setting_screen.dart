import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../shared/theme_data.dart';
import '../language_bottom_sheet.dart';
import '../provider.dart';
import '../theming_bottom_sheet.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                modalBottomSheetMenu();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: provider.isDark
                            ? const Color(0xffFACC1D)
                            : MyTheme.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: provider.language == 'en'
                      ? Text(AppLocalizations.of(context)!.english)
                      : Text(
                          AppLocalizations.of(context)!.arabic,
                        ),
                ),
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.theme,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                modalBottomSheetThem();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: provider.isDark
                            ? const Color(0xffFACC1D)
                            : MyTheme.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: provider.isDark
                      ? Text(AppLocalizations.of(context)!.dark)
                      : Text(
                          AppLocalizations.of(context)!.light,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void modalBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void modalBottomSheetThem() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => const ThemingBottomSheet(),
    );
  }
}

// AppLocalizations.of(context)!.settings,
// style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
