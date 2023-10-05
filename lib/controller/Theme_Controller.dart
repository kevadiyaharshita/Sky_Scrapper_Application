import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  bool _isDarkTheme = false;
  String GroupValue = 'light';
  late SharedPreferences preferences;

  ThemeController({required this.preferences});

  setGroupValue({required String val}) {
    GroupValue = val;
    notifyListeners();
  }

  get getTheme {
    _isDarkTheme = preferences.getBool('theme') ?? false;
    GroupValue = _isDarkTheme ? 'dark' : 'light';
    return _isDarkTheme;
  }

  changeTheme({required bool val}) {
    _isDarkTheme = val;
    preferences.setBool('theme', _isDarkTheme);
    notifyListeners();
  }
}
