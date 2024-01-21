import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/provider.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.isDark ? const Color(0xff141A2E) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (provider.language == 'ar') provider.changeLang();
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.english,
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.language == 'en'
                            ? MyTheme.primaryColor
                            : provider.isDark
                                ? Colors.white
                                : Colors.black),
                  ),
                  const Spacer(),
                  provider.language == 'ar'
                      ? const SizedBox.shrink()
                      : const Icon(
                          Icons.done,
                          size: 30,
                          color: MyTheme.primaryColor,
                        )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (provider.language == 'en') provider.changeLang();
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.arabic,
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.language == 'ar'
                            ? MyTheme.primaryColor
                            : provider.isDark
                                ? Colors.white
                                : Colors.black),
                  ),
                  const Spacer(),
                  provider.language == 'en'
                      ? const SizedBox.shrink()
                      : const Icon(
                          Icons.done,
                          size: 30,
                          color: MyTheme.primaryColor,
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
