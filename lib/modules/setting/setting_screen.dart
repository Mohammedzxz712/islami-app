import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const String routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'setting',
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    ));
  }
}
