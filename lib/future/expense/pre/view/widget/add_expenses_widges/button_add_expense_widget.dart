import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/future/expense/data/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../viewModel/cubit/expense_cubit.dart';

class ButtonAddExpenseWidget extends StatelessWidget {
  const ButtonAddExpenseWidget(
      {super.key,
      required this.descriptionController,
      required this.amountController,
      required this.dateController,
      required this.categoriesController,
      required this.timeController,
      required this.formkey});

  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController categoriesController;
  final TextEditingController timeController;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await BlocProvider.of<ExpenseCubit>(context)
                        .addNewDataFromDatabase(ExpanseModel.fromMap({
                      'description': descriptionController.text,
                      'amount': amountController.text,
                      'date': dateController.text,
                      'categories': categoriesController.text,
                      'time': timeController.text,
                    }));
                    descriptionController.clear();
                    amountController.clear();
                    dateController.clear();
                    categoriesController.clear();
                    timeController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add Expense"),
              ),
            ),
          ),
        );
      },
    );
  }
}
