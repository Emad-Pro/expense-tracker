import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
              child: Row(children: [
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
                      "100 \$",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaler.scale(30),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const Icon(
                          Icons.medical_services_outlined,
                          color: Color.fromARGB(255, 155, 0, 212),
                        ),
                      ],
                    ),
                    Text("Food")
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
