import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/modules/provider.dart';
import 'package:islami_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.isDark ? Color(0xff141A2E) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (provider.isDark == true) provider.changeThem();
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.light,
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.isDark == false
                            ? MyTheme.primaryColor
                            : provider.isDark
                                ? Colors.white
                                : Colors.black),
                  ),
                  Spacer(),
                  provider.isDark
                      ? SizedBox.shrink()
                      : Icon(
                          Icons.done,
                          size: 30,
                          color: MyTheme.primaryColor,
                        )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (provider.isDark == false) provider.changeThem();
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark,
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.isDark
                            ? MyTheme.primaryColor
                            : provider.isDark
                                ? Colors.white
                                : Colors.black),
                  ),
                  Spacer(),
                  provider.isDark == false
                      ? SizedBox.shrink()
                      : Icon(
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
