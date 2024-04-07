import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchEndDateWidget extends StatelessWidget {
  const SearchEndDateWidget({Key? key, required this.endDateController})
      : super(key: key);
  final TextEditingController endDateController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding.copyWith(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width * .4,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: TextFormField(
        readOnly: true,
        onTap: () {
          BottomPicker.date(
            closeIconColor: Theme.of(context).colorScheme.onBackground,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: 'Select the end date of your purchase'.tr(context),
            dateOrder: DatePickerDateOrder.dmy,
            maxDateTime: DateTime.now(),
            minDateTime: DateTime(1980),
            pickerTextStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
            ),
            onChange: (index) {
              endDateController.text = index.toString();
            },
            onSubmit: (index) {
              endDateController.text = index.toString();
            },
            bottomPickerTheme: BottomPickerTheme.orange,
          ).show(context);
        },
        controller: endDateController,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.date_range),
            border: InputBorder.none,
            hintText: "End Date".tr(context)),
      ),
    );
  }
}