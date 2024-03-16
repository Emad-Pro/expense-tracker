import 'package:expense_tracker/future/settingScreen/pre/view/widget/setting_screen_appBar.dart';
import 'package:expense_tracker/future/settingScreen/pre/view/widget/setting_screen_body.dart';

import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: settingScreenAppBar(context),
      body: const SettingScreenBody(),
    );
  }
}
