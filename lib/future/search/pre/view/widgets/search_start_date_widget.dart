import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchStartDateWidget extends StatelessWidget {
  const SearchStartDateWidget({super.key, required this.startDateController});
  final TextEditingController startDateController;
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
            title: 'Set your Expenses DateTime',
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
              print(index.toString());
              startDateController.text = index.toString();
            },
            onSubmit: (index) {
              print(index.toString());
              startDateController.text = index.toString();
            },
            bottomPickerTheme: BottomPickerTheme.orange,
          ).show(context);
        },
        controller: startDateController,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.date_range),
            border: InputBorder.none,
            hintText: "Start Date"),
      ),
    );
  }
}
