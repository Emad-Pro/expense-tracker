import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';

import 'package:expense_tracker/future/home/pre/view/home_screen.dart';
import 'package:expense_tracker/future/onboarding/view_model/cubit/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
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
      body: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CupertinoOnboarding(
                backgroundColor: Theme.of(context).colorScheme.primary,
                bottomButtonColor: Theme.of(context).colorScheme.inversePrimary,
                onPressedOnLastPage: () async {
                  if (formKey.currentState!.validate()) {
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

class OnboardingSelectCureuncyWidget extends StatelessWidget {
  const OnboardingSelectCureuncyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: const Text(
          "Select Currency",
          style: TextStyle(),
        ),
        trailing: DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.primary,
            value: BlocProvider.of<OnboardingCubit>(context).selectedCurrency,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            onChanged: (String? newValue) {
              BlocProvider.of<OnboardingCubit>(context)
                  .changeCurrencyMethod(newValue!);
            },
            items: BlocProvider.of<OnboardingCubit>(context)
                .currency
                .map((String currency) {
              return DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              );
            }).toList()),
      ),
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
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Your Name";
          } else {
            return null;
          }
        },
        controller: editingController,
        decoration: const InputDecoration(
            hintText: "User Name", border: InputBorder.none),
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
    return const CupertinoOnboardingPage(
      title: Text('Beautiful and Consistent Appearance'),
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
      title: const Text('Great Look in Light and Dark Mode'),
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
      title: const Text('Support Multi Language'),
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
      title: const Text("What's New App"),
      features: BlocProvider.of<OnboardingCubit>(context).featuresList(context),
    );
  }
}
