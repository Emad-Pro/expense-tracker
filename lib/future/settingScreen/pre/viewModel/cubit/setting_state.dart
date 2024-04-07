part of 'setting_cubit.dart';

class SettingState {}

class ThemeSettingChangedState extends SettingState {}

class ChangeLocaleState extends SettingState {
  final Locale locale;

  ChangeLocaleState({required this.locale});
}
