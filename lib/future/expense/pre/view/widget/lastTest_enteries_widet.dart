import 'package:expense_tracker/future/expense/pre/view/widget/build_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/lastest_enteries/view/lastest_enteries.dart';
import 'package:flutter/material.dart';

class LastTestEnteriesWidet extends StatelessWidget {
  const LastTestEnteriesWidet({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: MediaQuery.of(context).padding.copyWith(
                top: 10,
              ),
          child: Row(
            children: [
              Text(
                "Lastest Enteries",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(16),
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          LastestEnteries(expenseState: expenseState)));
                },
                child: const Text("View all"),
              )
            ],
          ),
        ),
        BuildListViewLastTestEnteries(
          expenseState: expenseState,
        ),
      ],
    );
  }
}
