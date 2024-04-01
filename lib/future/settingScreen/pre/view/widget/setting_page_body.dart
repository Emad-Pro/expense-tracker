import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/service_locator.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/future/settingScreen/pre/view/widget/custom_listTile_widget.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          CustomListTileWidget(
            icon: CupertinoIcons.profile_circled,
            onTap: () {},
            title: "Profile".tr(context),
            subtitle: "Profile Details".tr(context),
            color: Colors.blue[900],
            widget:
                BlocProvider.of<SettingCubit>(context).locale!.languageCode ==
                        "en"
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(Icons.keyboard_arrow_left),
          ),
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
          CustomListTileWidget(
            widget:
                BlocProvider.of<SettingCubit>(context).locale!.languageCode ==
                        "en"
                    ? const Icon(Icons.keyboard_arrow_right)
                    : const Icon(Icons.keyboard_arrow_left),
            icon: CupertinoIcons.info_circle_fill,
            color: Colors.purple[900],
            onTap: () {},
            title: "About".tr(context),
            subtitle: "Information about the developer".tr(context),
          ),
        ],
      ),
    );
  }
}
