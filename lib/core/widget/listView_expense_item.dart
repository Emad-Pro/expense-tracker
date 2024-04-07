import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/core/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class ListViewExpenseItem extends StatelessWidget {
  final List<ExpensesModel>? getExpansesModel;
  final bool isSlidable;
  final String? choiceCubit;
  const ListViewExpenseItem(
      {super.key,
      required this.getExpansesModel,
      required this.isSlidable,
      this.choiceCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: getExpansesModel!.length,
          itemBuilder: (context, index) {
            return BuildItemListViewLastTestEnteries(
                choseCubit: choiceCubit,
                isSlidable: isSlidable,
                expensesModel: getExpansesModel![index]);
          }),
    );
  }
}
