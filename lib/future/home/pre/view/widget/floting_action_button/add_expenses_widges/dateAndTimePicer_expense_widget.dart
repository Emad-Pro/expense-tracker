import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/dateAndTimePicer/date_textformFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/dateAndTimePicer/time_textFormfiled_widget.dart';
import 'package:flutter/material.dart';

class DateAndTimePicerExpenseWidget extends StatelessWidget {
  const DateAndTimePicerExpenseWidget({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  final TextEditingController dateController;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          DateFormFiledWidget(
            dateController: dateController,
          ),
          const Spacer(),
          TimeTextFormfiledWidget(
            timeController: timeController,
          )
        ],
      ),
    );
  }
}
