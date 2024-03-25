import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormFiledWidget extends StatelessWidget {
  final TextEditingController dateController;

  const DateFormFiledWidget({super.key, required this.dateController});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.39,
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Enter Date",
              prefixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    BottomPicker.date(
                      closeIconColor:
                          Theme.of(context).colorScheme.onBackground,
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
                        dateController.text = DateFormat('dd , MMM, yyy')
                            .format(index)
                            .toString();
                      },
                      onSubmit: (index) {
                        dateController.text = DateFormat('dd , MMM, yyy')
                            .format(index)
                            .toString();
                      },
                      bottomPickerTheme: BottomPickerTheme.orange,
                    ).show(context);
                  })),
          controller: dateController,
        ),
      ),
    );
  }
}
