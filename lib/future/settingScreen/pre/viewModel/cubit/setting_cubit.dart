import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/language_cache/language_cache.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/core/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.languageCacheHelper) : super(const SettingState());
  final LanguageCacheHelper languageCacheHelper;
  Locale? locale = const Locale("en");

  // profile Edit
  final TextEditingController currancyEditingController =
      TextEditingController(text: ProfileService.currancy);
  final TextEditingController profileEditingController =
      TextEditingController(text: ProfileService.userName);

  changeCurrencyValue(String val) {
    currancyEditingController.text = val;
    emit(const SettingState());
  }

  changeProfileInfo() async {
    await CacheHelper.saveData(
        key: "currancy", value: currancyEditingController.text);
    await CacheHelper.saveData(
        key: "userName", value: profileEditingController.text);
    ProfileService.initProfile();
    emit(state.copyWith(changeProfileInfoState: RequestState.sucess));
  }

  // profile Edit
  changeThemeMode() async {
    emit(ThemeSettingChangedLoadingState());
    await ThemeService.changeDarkMode();
    emit(ThemeSettingChangedSuccessState());
  }

  Future<void> getSavedLanguage() async {
    final String cacheLanguageCode =
        await languageCacheHelper.getCacheLanguageCode();
    locale = Locale(cacheLanguageCode);
    emit(ChangeLocaleState(locale: Locale(cacheLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await languageCacheHelper
        .setCacheLanguageCode(languageCode)
        .then((value) {});
    locale = Locale(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
