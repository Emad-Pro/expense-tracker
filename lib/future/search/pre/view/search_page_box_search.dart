import 'package:expense_tracker/future/search/pre/view/widgets/min_and_max_amount_widget.dart';

import 'package:expense_tracker/future/search/pre/view/widgets/search_buttons_widget.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/search_description_widget.dart';

import 'package:expense_tracker/future/search/pre/view/widgets/start_and_end_date_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageBoxSearch extends StatelessWidget {
  SearchPageBoxSearch({super.key});
  final TextEditingController endAamountController = TextEditingController();
  final TextEditingController startAmountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          TextFormFiledSearchWidget(
            textFormFiledController: descriptionController,
            hintText: "Description",
          ),
          StartAndEndDateWndgets(
              startDateController: startDateController,
              endDateController: endDateController),
          MinAndMaxAmountWidget(
              startAmountController: startAmountController,
              endAamountController: endAamountController),
          TextFormFiledSearchWidget(
            textFormFiledController: categoryController,
            hintText: "Category",
          ),
          SearchButtonsWidget(
              endAmountController: endAamountController,
              startAmountController: startAmountController,
              startDateController: startDateController,
              endDateController: endDateController,
              categoryController: categoryController,
              descriptionController: descriptionController),
        ])
      ],
    );
  }
}
