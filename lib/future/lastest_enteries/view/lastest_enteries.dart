import 'package:expense_tracker/future/home/pre/view/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class LastestEnteries extends StatelessWidget {
  const LastestEnteries({Key? key, required this.expenseState})
      : super(key: key);
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lastest Enteries"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
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
