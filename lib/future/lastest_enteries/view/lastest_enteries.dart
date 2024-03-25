import 'package:expense_tracker/future/expense/pre/view/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class LastestEnteries extends StatelessWidget {
  const LastestEnteries({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lastest Enteries"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            itemCount: expenseState.getDatabaseExpansesModel!.length,
            itemBuilder: (context, index) {
              return BuildItemListViewLastTestEnteries(
                  expanseModelGetData:
                      expenseState.getDatabaseExpansesModel![index]);
            }),
      ),
    );
  }
}
