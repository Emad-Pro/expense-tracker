import 'package:expense_tracker/future/home/pre/view/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class BuildListViewLastTestEnteries extends StatelessWidget {
  const BuildListViewLastTestEnteries({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
            itemCount: expenseState.getDatabaseExpansesModel!.length,
            itemBuilder: (context, index) {
              return BuildItemListViewLastTestEnteries(
                expanseModelGetData:
                    expenseState.getDatabaseExpansesModel![index],
              );
            }));
  }
}
