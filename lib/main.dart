import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/database/isar_service.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/future/categoires/view_model/cubit/category_cubit.dart';

import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/home/pre/view_model/cubit/home_cubit.dart';
import 'package:expense_tracker/future/search/data/model/expenses_search_model.dart';
import 'package:expense_tracker/future/search/pre/view_model/cubit/search_cubit.dart';

import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ProfileService.initProfile();

  ServiceLocator().init();
  await IsarDataBaseImp().initialize();
  await ThemeService.themeInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<SettingCubit>()..getSavedLanguage()),
          BlocProvider.value(value: getIt<CategoryCubit>()),
          BlocProvider.value(value: getIt<SearchCubit>()),
          BlocProvider(
              create: (context) =>
                  ExpenseCubit(getIt())..getDataFromDatabase()),
          BlocProvider(create: (context) => HomeCubit()..initState())
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ExpenseCubit, ExpenseState>(
                listener: (context, state) {
              if (state.deleteExpensesData == RequestState.sucess) {
                BlocProvider.of<SearchCubit>(context)
                    .multipleSearchMethod(ExpenseSearchModel());
              } else if (state.updateExpansesData == RequestState.sucess) {
                BlocProvider.of<SearchCubit>(context)
                    .multipleSearchMethod(ExpenseSearchModel());
              }
            }),
            BlocListener<CategoryCubit, CategoryState>(
                listener: (context, state) {
              if (state.deleteItemState == RequestState.sucess) {
                BlocProvider.of<ExpenseCubit>(context).getDataFromDatabase();
                BlocProvider.of<SearchCubit>(context)
                    .multipleSearchMethod(ExpenseSearchModel());
              }
            })
          ],
          child: Builder(
            builder: (context) {
              context.watch<SettingCubit>().state;
              return MaterialApp(
                locale: BlocProvider.of<SettingCubit>(context).locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                title: 'Expense Tracker',
                theme: ThemeService().lightMode(context),
                darkTheme: ThemeService().darkMode(context),
                themeMode: ThemeService.darkModeValue
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: ProfileService.homewidget(),
              );
            },
          ),
        ));
  }
}
