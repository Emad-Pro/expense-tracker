import 'package:animate_do/animate_do.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/core/widget/custom_listTile_widget.dart';
import 'package:expense_tracker/future/settingScreen/pages/howIm.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pages/profile/edit_profile_page.dart';

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
          FadeInDown(
            child: CustomListTileWidget(
              icon: CupertinoIcons.profile_circled,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditProfilePage();
                }));
              },
              title: "Profile".tr(context),
              subtitle: "Profile Details".tr(context),
              color: Colors.blue[900],
              widget:
                  BlocProvider.of<SettingCubit>(context).locale!.languageCode ==
                          "en"
                      ? const Icon(Icons.keyboard_arrow_right)
                      : const Icon(Icons.keyboard_arrow_left),
            ),
          ),
          FadeInLeft(
            child: BlocBuilder<SettingCubit, SettingState>(
                builder: (context, state) {
              return CustomListTileWidget(
                icon: CupertinoIcons.moon_fill,
                color: Colors.orange[900],
                title: "Theme Mode".tr(context),
                subtitle: "You can switch between light mode and dark mode"
                    .tr(context),
                widget: Switch(
                    value: ThemeService.darkModeValue,
                    onChanged: (value) {
                      getIt<SettingCubit>().changeThemeMode();
                    }),
              );
            }),
          ),
          FadeInRight(
            child: CustomListTileWidget(
              icon: Icons.language,
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
          ),
          FadeInUp(
            child: CustomListTileWidget(
              widget:
                  BlocProvider.of<SettingCubit>(context).locale!.languageCode ==
                          "en"
                      ? const Icon(Icons.keyboard_arrow_right)
                      : const Icon(Icons.keyboard_arrow_left),
              icon: CupertinoIcons.info_circle_fill,
              color: Colors.purple[900],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HowImPage()));
              },
              title: "About".tr(context),
              subtitle: "Information about the developer".tr(context),
            ),
          ),
        ],
      ),
    );
  }
}
