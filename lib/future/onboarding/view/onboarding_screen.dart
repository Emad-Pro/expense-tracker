import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/sharedPreferences/cacheHelper.dart';
import 'package:expense_tracker/future/home/pre/view/home_screen.dart';
import 'package:expense_tracker/future/onboarding/view_model/cubit/onboarding_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  TextEditingController editingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
          return CupertinoOnboarding(
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
                WhatsNewPage(
                  scrollPhysics: const BouncingScrollPhysics(),
                  title: const Text("What's New Template"),
                  features:
                      BlocProvider.of<OnboardingCubit>(context).featuresList,
                ),
                const CupertinoOnboardingPage(
                  title: Text('Support Multi Language'),
                  body: Icon(
                    Icons.language,
                    size: 200,
                  ),
                ),
                const CupertinoOnboardingPage(
                  title: Text('Great Look in Light and Dark Mode'),
                  body: Icon(
                    CupertinoIcons.sun_max,
                    size: 200,
                  ),
                ),
                const CupertinoOnboardingPage(
                  title: Text('Beautiful and Consistent Appearance'),
                  body: Icon(
                    CupertinoIcons.check_mark_circled,
                    size: 200,
                  ),
                ),
                CupertinoOnboardingPage(
                  titleFlex: 1,
                  title: const Text(
                    'Register your data',
                  ),
                  body: Wrap(
                    children: [
                      const Center(
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: 200,
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Material(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Name";
                              } else {
                                return null;
                              }
                            },
                            controller: editingController,
                            decoration:
                                const InputDecoration(hintText: "User Name"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]);
        }));
  }
}
