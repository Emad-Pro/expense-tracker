import 'package:expense_tracker/core/database/isar_service.dart';
import 'package:expense_tracker/core/language_cache/language_cache.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerFactory(() => LanguageCacheHelper());
    getIt.registerLazySingleton(() => SettingCubit(getIt()));
    getIt.registerSingleton<IsarDataBase>(IsarDataBaseImp());
  }
}
