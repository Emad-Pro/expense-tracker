import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/future/home/data/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../viewModel/cubit/expense_cubit.dart';

class ButtonAddExpenseWidget extends StatelessWidget {
  const ButtonAddExpenseWidget({
    super.key,
    required this.descriptionController,
    required this.amountController,
    required this.dateController,
    required this.categoriesController,
    required this.timeController,
  });

  final TextEditingController descriptionController;
  final TextEditingController amountController;
  final TextEditingController dateController;
  final TextEditingController categoriesController;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseCubit, ExpenseState>(
      listener: (context, state) {
        if (state.addExpenseItem == RequestState.sucess) {
          descriptionController.clear();
          amountController.clear();
          dateController.clear();
          categoriesController.clear();
          timeController.clear();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () async {
                BlocProvider.of<ExpenseCubit>(context)
                    .addNewDataFromDatabase(ExpanseModel.fromMap({
                  'description': descriptionController.text,
                  'amount': amountController.text,
                  'date': dateController.text,
                  'categories': categoriesController.text,
                  'time': timeController.text,
                }));
              },
              child: const Text("Add Expense"),
            ),
          ),
        );
      },
    );
  }
}
