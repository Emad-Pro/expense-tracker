import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeTextFormfiledWidget extends StatelessWidget {
  final TextEditingController timeController;

  const TimeTextFormfiledWidget({super.key, required this.timeController});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Enter Time",
              prefixIcon: IconButton(
                  icon: const Icon(Icons.access_time_sharp),
                  onPressed: () {
                    BottomPicker.time(
                      closeIconColor:
                          Theme.of(context).colorScheme.onBackground,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      title: 'Set your Expenses time',
                      initialTime: Time.now(),
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
                        timeController.text =
                            DateFormat.Hm().format(index).toString();
                      },
                      onSubmit: (index) {
                        timeController.text =
                            DateFormat.Hm().format(index).toString();
                      },
                      bottomPickerTheme: BottomPickerTheme.orange,
                    ).show(context);
                  })),
          controller: timeController,
        ),
      ),
    );
  }
}
