import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppLocalizations.of(context)!.settings,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    ));
  }
}
