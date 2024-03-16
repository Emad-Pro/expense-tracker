import 'package:expense_tracker/core/database/sqflite_service.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(() => SettingCubit());
    getIt.registerSingleton<DatabaseSqfliteService>(DatabaseSqfliteService());
  }
}
