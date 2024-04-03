import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/core/widget/build_custom_icon_category.dart';
import 'package:flutter/material.dart';

class CustomIconsStackWidget extends StatelessWidget {
  const CustomIconsStackWidget({super.key, required this.expensesModel});
  final ExpensesModel expensesModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: const SizedBox(
            width: 40,
            height: 40,
          ),
        ),
        BuildCustomIconCategory(categoryItem: expensesModel.categories!)
      ],
    );
  }
}
