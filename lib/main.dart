import 'package:expense_tracker/core/database/sqflite_service.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/service_locator.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/home/pre/view_model/cubit/home_cubit.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ProfileService.initProfile();
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
          create: (context) => ExpenseCubit(getIt())..getDataFromDatabase(),
        ),
        BlocProvider(create: (context) => HomeCubit()..initState())
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Expense Tracker',
            theme: ThemeService().lightMode,
            darkTheme: ThemeService().darkMode,
            themeMode:
                ThemeService.darkModeValue ? ThemeMode.dark : ThemeMode.light,
            home: ProfileService.homewidget(),
          );
        },
      ),
    );
  }
}
