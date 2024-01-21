import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String language = 'ar';
  bool isDark = false;

  void changeLang() {
    if (language == 'en') {
      language = 'ar';
      notifyListeners();
    } else {
      language = 'en';
      notifyListeners();
    }
    notifyListeners();
  }

  void changeThem() {
    isDark = !isDark;
    notifyListeners();
  }
}
