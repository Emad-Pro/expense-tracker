import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/app_constanse.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/future/onboarding/view/onboarding_screen.dart';
import 'package:expense_tracker/future/settingScreen/pre/viewModel/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تعديل الملف الشخصي"),
        centerTitle: true,
      ),
      body: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Initicon(
                    backgroundColor: const Color.fromARGB(255, 74, 20, 140),
                    text: ProfileService.userName!,
                    size: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: BlocProvider.of<SettingCubit>(context)
                          .profileEditingController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_sharp),
                          hintText: "User Name",
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    title: Text(
                      "Select Currency".tr(context),
                      style: const TextStyle(),
                    ),
                    trailing: DropdownButton<String>(
                        dropdownColor: Theme.of(context).colorScheme.primary,
                        value: BlocProvider.of<SettingCubit>(context)
                            .currancyEditingController
                            .text,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        underline: Container(),
                        onChanged: (String? newValue) {
                          BlocProvider.of<SettingCubit>(context)
                              .changeCurrencyValue(newValue!);
                        },
                        items: AppConstanse.currency.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency.tr(context)),
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: MaterialButton(
                    padding: const EdgeInsets.all(15),
                    color: Theme.of(context).colorScheme.inversePrimary,
                    onPressed: () {
                      BlocProvider.of<SettingCubit>(context)
                          .changeProfileInfo();
                    },
                    child: Text(
                      "update".tr(context),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
