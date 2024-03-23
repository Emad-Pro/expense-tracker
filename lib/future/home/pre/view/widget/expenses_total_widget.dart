import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExpensesTotalWidget extends StatelessWidget {
  final ExpenseState expenseState;

  const ExpensesTotalWidget({super.key, required this.expenseState});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding.copyWith(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.2,
              1.2,
            ],
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF8E0F28)
                  : const Color(0xFFEFB8C8),
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF8E0F28)
                  : const Color(0xFFEFB8C8),
            ],
          )),
      child: Padding(
        padding: MediaQuery.of(context)
            .padding
            .copyWith(top: 10.0, bottom: 15, left: 20, right: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Expenses",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaler.scale(14),
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${expenseState.totalAmount} \$",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(30),
                    color: Theme.of(context).textTheme.titleLarge!.color!,
                  ),
                )
              ],
            ),
            const Spacer(),
            if (expenseState.getMonthsExpense != null)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.27,
                child: FormBuilderDropdown<String>(
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
      ),
    );
  }
}
