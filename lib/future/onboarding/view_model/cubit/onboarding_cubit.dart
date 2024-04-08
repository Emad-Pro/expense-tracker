import 'package:bloc/bloc.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  String selectedCurrency = 'USD';
  List<Widget> featuresList(context) => [
        WhatsNewFeature(
          title: Text('Ease of use'.tr(context)),
          description: Text(
              'The user-friendly, well-designed interface makes it easy for users to navigate through the app and enter their expenses quickly and efficiently'
                  .tr(context),
              textAlign: TextAlign.justify),
          icon: Icon(
            CupertinoIcons.star,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        WhatsNewFeature(
          title: Text("Ease Add  and tracking".tr(context)),
          description: Text(
              "It can take long term financial costs . That's why you might want to get this expense tracking app. It provides an independent classification of items. These apps use advanced algorithms to analyze your budget and automatically assign you expenses"
                  .tr(context),
              textAlign: TextAlign.justify),
          icon: Icon(
            CupertinoIcons.escape,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        WhatsNewFeature(
          title: Text('Real-time synchronization and data backup'.tr(context)),
          description: Text(
            "Provides real-time synchronization and data backup. This ensures that your expense data is always up to date and stored securely"
                .tr(context),
            textAlign: TextAlign.justify,
          ),
          icon: Icon(
            CupertinoIcons.time,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ];

  changeCurrencyMethod(String value) {
    selectedCurrency = value;
    emit(ChangeCurrencyValueState());
  }
}
