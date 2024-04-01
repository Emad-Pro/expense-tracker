import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/core/method_date.dart';
import 'package:expense_tracker/future/expense/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/custom_icons_stack_widget.dart';

import 'package:flutter/material.dart';

class BuildItemListViewLastTestEnteries extends StatelessWidget {
  final ExpensesModel expensesModel;
  const BuildItemListViewLastTestEnteries({
    super.key,
    required this.expensesModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
      child: Row(
        children: [
          CustomIconsStackWidget(expensesModel: expensesModel),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expensesModel.description!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${convertDateToDayYearMounth(expensesModel.date!.toString())}, ${convertTime(expensesModel.time!.toString())}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            "${expensesModel.amount} \$",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
