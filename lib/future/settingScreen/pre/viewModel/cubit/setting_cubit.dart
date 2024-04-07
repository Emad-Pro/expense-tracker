import 'package:expense_tracker/core/language_cache/language_cache.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.languageCacheHelper) : super(SettingState());
  final LanguageCacheHelper languageCacheHelper;
  Locale? locale = const Locale("en");
  changeThemeMode() async {
    await ThemeService.changeDarkMode();
    emit(ThemeSettingChangedState());
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
