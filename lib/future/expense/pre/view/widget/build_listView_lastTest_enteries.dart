import 'package:expense_tracker/future/expense/pre/view/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class BuildListViewLastTestEnteries extends StatelessWidget {
  const BuildListViewLastTestEnteries({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expenseState.getDatabaseExpansesModel!.length <= 2
            ? expenseState.getDatabaseExpansesModel!.length
            : 2,
        itemBuilder: (context, index) {
          return BuildItemListViewLastTestEnteries(
            expanseModelGetData: expenseState.getDatabaseExpansesModel![index],
          );
        });
  }
}
