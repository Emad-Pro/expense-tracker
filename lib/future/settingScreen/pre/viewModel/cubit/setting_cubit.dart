import 'package:expense_tracker/core/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState());

  changeThemeMode() async {
    await ThemeService.changeDarkMode();
    emit(ThemeSettingChangedState());
  }
}
