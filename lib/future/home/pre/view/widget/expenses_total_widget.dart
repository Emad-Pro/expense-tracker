import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExpensesTotalWidget extends StatelessWidget {
  ExpensesTotalWidget({super.key, required this.expenseState});
  final ExpenseState expenseState;
  final List<String> genderOptions = [
    'Jan',
    'Feb',
    'Mar',
    'Apق',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      //  height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              1.2,
            ],
            colors: [
              Color.fromARGB(255, 237, 104, 73),
              Color.fromARGB(255, 240, 138, 54),
            ],
          )),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 10.0, bottom: 15, start: 20, end: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Expenses",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${expenseState.totalAmount} \$",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 100,
              child: FormBuilderDropdown<String>(
                isDense: false,
                isExpanded: false,
                name: 'gender',
                initialValue: genderOptions[0],
                decoration: const InputDecoration(
                    alignLabelWithHint: true, border: InputBorder.none),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(gender),
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
