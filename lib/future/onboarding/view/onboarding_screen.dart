import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/core/widget/custom_listTile_widget.dart';

import 'package:expense_tracker/future/home/pre/view/home_screen.dart';
import 'package:expense_tracker/future/onboarding/view_model/cubit/onboarding_cubit.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  TextEditingController editingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("Expenses Tracker".tr(context)),
      ),
      drawer: const OnBoardingDrawer(),
      body: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CupertinoOnboarding(
                backgroundColor: Theme.of(context).colorScheme.background,
                bottomButtonColor: Colors.blue,
                onPressedOnLastPage: () async {
                  if (formKey.currentState!.validate()) {
                    await CacheHelper.saveData(
                        key: "currancy",
                        value: BlocProvider.of<OnboardingCubit>(context)
                            .selectedCurrency);
                    await CacheHelper.saveData(
                            key: "userName", value: editingController.text)
                        .then((value) async {
                      await CacheHelper.saveData(key: "boarding", value: true)
                          .then((value) async {
                        ProfileService.userName =
                            await CacheHelper.getSaveData(key: "userName");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    });
                  }
                },
                pages: [
                  const WhatsNewAppWidget(),
                  const SupportMultiLanguageWidget(),
                  const LookDarkAndLightWidget(),
                  const BeautifulApperanceWidget(),
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const ProfileIconWidget(),
                            OnboardingTextFormFiledWidget(
                                editingController: editingController),
                            const SizedBox(
                              height: 15,
                            ),
                            const OnboardingSelectCureuncyWidget()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class OnBoardingDrawer extends StatelessWidget {
  const OnBoardingDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text(
            "Settings".tr(context),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ))),
          BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
            return CustomListTileWidget(
              icon: CupertinoIcons.moon_fill,
              color: Colors.orange[900],
              title: "Theme Mode".tr(context),
              subtitle:
                  "You can switch between light mode and dark mode".tr(context),
              widget: Switch(
                  value: ThemeService.darkModeValue,
                  onChanged: (value) {
                    getIt<SettingCubit>().changeThemeMode();
                  }),
            );
          }),
          CustomListTileWidget(
            icon: Icons.language,
            onTap: () {},
            title: "language".tr(context),
            subtitle: "You can switch between Arabic and English".tr(context),
            color: Colors.green[900],
            widget: SizedBox(
              height: 200,
              width: 100,
              child: DropdownButton<String>(
                  isExpanded: true,
                  isDense: false,
                  value: BlocProvider.of<SettingCubit>(context)
                              .locale!
                              .languageCode ==
                          "en"
                      ? "English"
                      : "Arabic",
                  items: ["English", "Arabic"].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items.tr(context)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue == "English") {
                      BlocProvider.of<SettingCubit>(context)
                          .changeLanguage("en");
                    } else if (newValue == "Arabic") {
                      BlocProvider.of<SettingCubit>(context)
                          .changeLanguage("ar");
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingSelectCureuncyWidget extends StatelessWidget {
  const OnboardingSelectCureuncyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(
              "Select Currency".tr(context),
              style: TextStyle(),
            ),
            trailing: DropdownButton<String>(
                dropdownColor: Theme.of(context).colorScheme.primary,
                value:
                    BlocProvider.of<OnboardingCubit>(context).selectedCurrency,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                underline: Container(),
                onChanged: (String? newValue) {
                  if (kDebugMode) {
                    print(newValue);
                  }
                  BlocProvider.of<OnboardingCubit>(context)
                      .changeCurrencyMethod(newValue!);
                },
                items: BlocProvider.of<OnboardingCubit>(context)
                    .currency
                    .map((String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(currency.tr(context)),
                  );
                }).toList()),
          ),
        );
      },
    );
  }
}

class OnboardingTextFormFiledWidget extends StatelessWidget {
  const OnboardingTextFormFiledWidget({
    super.key,
    required this.editingController,
  });

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, left: 15, right: 20, bottom: 7),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Your Name".tr(context);
          } else {
            return null;
          }
        },
        controller: editingController,
        decoration: InputDecoration(
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.onBackground),
            hintText: "User Name".tr(context),
            border: InputBorder.none),
      ),
    );
  }
}

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.profile_circled,
        size: 200,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

class BeautifulApperanceWidget extends StatelessWidget {
  const BeautifulApperanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboardingPage(
      title: Text('Beautiful and Consistent Appearance'.tr(context)),
      body: Icon(
        CupertinoIcons.check_mark_circled,
        size: 200,
      ),
    );
  }
}

class LookDarkAndLightWidget extends StatelessWidget {
  const LookDarkAndLightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboardingPage(
      title: Text('Great Look in Light and Dark Mode'.tr(context)),
      body: Icon(
        CupertinoIcons.sun_max,
        size: 200,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

class SupportMultiLanguageWidget extends StatelessWidget {
  const SupportMultiLanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboardingPage(
      title: Text('Support Multi Language'.tr(context)),
      body: Icon(
        Icons.language,
        size: 200,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

class WhatsNewAppWidget extends StatelessWidget {
  const WhatsNewAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WhatsNewPage(
      scrollPhysics: const BouncingScrollPhysics(),
      title: Text("What's new in the application?".tr(context)),
      features: BlocProvider.of<OnboardingCubit>(context).featuresList(context),
    );
  }
}
