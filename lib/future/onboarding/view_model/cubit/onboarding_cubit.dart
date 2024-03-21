import 'package:bloc/bloc.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  List<Widget> featuresList = [
    const WhatsNewFeature(
      title: Text(' Ease of use'),
      description: Text(
          'The user-friendly, well-designed interface makes it easy for users to navigate through the app and enter their expenses quickly and efficiently'),
      icon: Icon(CupertinoIcons.star),
    ),
    const WhatsNewFeature(
      title: Text("Add ease and tracking"),
      description: Text(
          "It can take long-term financial costs for mistakes. That's why you might want to get this expense tracking app. It provides an independent classification of items. These apps use advanced algorithms to analyze your budget and automatically assign you expenses"),
      icon: Icon(CupertinoIcons.escape),
    ),
    const WhatsNewFeature(
      title: Text('Real-time synchronization and data backup'),
      description: Text(
          "Provides real-time synchronization and data backup. This ensures that your expense data is always up to date and stored securely"),
      icon: Icon(CupertinoIcons.time),
    ),
  ];
}
