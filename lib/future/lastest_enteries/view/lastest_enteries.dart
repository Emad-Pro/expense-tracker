import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class LastestEnteries extends StatelessWidget {
  const LastestEnteries({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lastest Enteries".tr(context)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: expenseState.getExpansesModel!.length,
            itemBuilder: (context, index) {
              return BuildItemListViewLastTestEnteries(
                  expensesModel: expenseState.getExpansesModel![index]);
            }),
      ),
    );
  }
}
