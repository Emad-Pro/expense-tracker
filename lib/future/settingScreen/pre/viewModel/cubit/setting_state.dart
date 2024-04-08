part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final RequestState? changeProfileInfoState;

  const SettingState({this.changeProfileInfoState});
  SettingState copyWith({RequestState? changeProfileInfoState}) {
    return SettingState(
        changeProfileInfoState:
            changeProfileInfoState ?? this.changeProfileInfoState);
  }

  @override
  List<Object?> get props => [changeProfileInfoState];
}

class ThemeSettingChangedLoadingState extends SettingState {}

class ThemeSettingChangedSuccessState extends SettingState {}

class ChangeLocaleState extends SettingState {
  final Locale locale;

  const ChangeLocaleState({required this.locale});
  @override
  List<Object?> get props => [locale];
}
