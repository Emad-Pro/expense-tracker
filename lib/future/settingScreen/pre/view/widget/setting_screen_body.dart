import 'package:expense_tracker/core/service_locator.dart';
import 'package:expense_tracker/core/theme/theme.dart';
import 'package:expense_tracker/future/settingScreen/pre/view/widget/custom_listTile_widget.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .2,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.settings, size: 100, color: Colors.white),
                Text(
                  "Hello \nJohn Doe",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          CustomListTileWidget(
            icon: CupertinoIcons.profile_circled,
            onTap: () {},
            title: "Profile",
            subtitle: "Profile Details",
            color: Colors.blue[900],
          ),
          BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
            return CustomListTileWidget(
              icon: CupertinoIcons.moon_fill,
              color: Colors.orange[900],
              title: "Theme Mode",
              subtitle: "change mode",
              widget: Switch(
                  value: ThemeService.darkModeValue,
                  onChanged: (value) {
                    getIt<SettingCubit>().changeThemeMode();
                  }),
            );
          }),
          CustomListTileWidget(
            icon: CupertinoIcons.info_circle_fill,
            color: Colors.purple[900],
            onTap: () {},
            title: "About",
            subtitle: "Information about the developer",
          ),
        ],
      ),
    );
  }
}
