import 'package:expense_tracker/core/method_date.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExpensesTotalWidget extends StatelessWidget {
  final ExpenseState expenseState;

  const ExpensesTotalWidget({super.key, required this.expenseState});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Expenses",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(14),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${expenseState.totalAmount} \$",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(30),
                ),
              )
            ],
          ),
          const Spacer(),
          if (expenseState.getMonthsExpense != null)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: FormBuilderDropdown<String>(
                onChanged: (value) {
                  BlocProvider.of<ExpenseCubit>(context)
                      .getDataQuaryFromDataBase(value!);
                },
                isDense: false,
                isExpanded: false,
                name: 'month',
                initialValue: expenseState.getMonthsExpense!.isEmpty
                    ? ""
                    : expenseState.getMonthsExpense![0],
                decoration: const InputDecoration(
                    alignLabelWithHint: false, border: InputBorder.none),
                items: expenseState.getMonthsExpense!
                    .map((month) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: month,
                          child: Text(month),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
