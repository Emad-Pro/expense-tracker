import 'package:expense_tracker/future/search/pre/view/widgets/search_end_date_widget.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/search_start_date_widget.dart';
import 'package:flutter/material.dart';

class StartAndEndDateWndgets extends StatelessWidget {
  const StartAndEndDateWndgets({
    super.key,
    required this.startDateController,
    required this.endDateController,
  });

  final TextEditingController startDateController;
  final TextEditingController endDateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchStartDateWidget(
          startDateController: startDateController,
        ),
        const Spacer(),
        SearchEndDateWidget(endDateController: endDateController)
      ],
    );
  }
}
