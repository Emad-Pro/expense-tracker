import 'package:expense_tracker/core/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class BuildListViewLastTestEnteries extends StatelessWidget {
  const BuildListViewLastTestEnteries({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expenseState.getExpansesModel!.length <= 4
            ? expenseState.getExpansesModel!.length
            : 2,
        itemBuilder: (context, index) {
          return BuildItemListViewLastTestEnteries(
            isSlidable: false,
            expensesModel: expenseState.getExpansesModel![index],
          );
        });
  }
}
