import 'package:expense_tracker/core/database/sqflite_service.dart';
import 'package:expense_tracker/core/service_locator.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/future/home/pre/view/home_screen.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DatabaseSqfliteService().database;
  ServiceLocator().init();
  await ThemeService.themeInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<SettingCubit>(),
        ),
        BlocProvider(
          create: (context) => ExpenseCubit(getIt()),
        ),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Expense Tracker',
            theme: ThemeService().lightMode,
            darkTheme: ThemeService().darkMode,
            themeMode:
                ThemeService.darkModeValue ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
