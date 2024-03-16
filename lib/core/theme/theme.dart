import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:flutter/material.dart';

class ThemeService {
  ThemeData lightMode = ThemeData.light(useMaterial3: true);
  ThemeData darkMode = ThemeData.dark(useMaterial3: true);
  static bool darkModeValue = false;
  static Future themeInit() async {
    if (CacheHelper.getSaveData(key: "darkMode") == null) {
      CacheHelper.saveData(key: "darkMode", value: false);
    }
    darkModeValue = await CacheHelper.getSaveData(key: "darkMode");
  }

  static Future changeDarkMode() async {
    darkModeValue = !darkModeValue;
    print(darkModeValue);
    await CacheHelper.saveData(key: "darkMode", value: darkModeValue);
  }
}
