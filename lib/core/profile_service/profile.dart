import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/future/home/pre/view/home_screen.dart';
import 'package:expense_tracker/future/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

class ProfileService {
  static bool? boarding;
  static String? userName;
  static initProfile() async {
    boarding = await CacheHelper.getSaveData(key: 'boarding');

    if (await CacheHelper.getSaveData(key: 'userName') != null) {
      userName = await CacheHelper.getSaveData(key: 'userName');
    }
    print(boarding);
  }

  static Widget homewidget() {
    if (boarding != null) {
      return HomeScreen();
    } else {
      return OnboardingScreen();
    }
  }
}
