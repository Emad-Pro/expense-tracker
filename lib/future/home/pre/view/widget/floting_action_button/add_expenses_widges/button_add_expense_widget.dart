import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../expense/pre/viewModel/cubit/expense_cubit.dart';

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
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 0, bottom: 5),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await BlocProvider.of<ExpenseCubit>(context)
                        .addNewDataFromDatabase(
                      ExpensesModel()
                        ..amount = double.parse(amountController.text)
                        ..categories = categoriesController.text
                        ..time = DateFormat.Hm().parse(timeController.text)
                        ..date = DateFormat('dd , MMM, yyy')
                            .parse(dateController.text)
                        ..description = descriptionController.text,
                    );
                    descriptionController.clear();
                    amountController.clear();
                    dateController.clear();
                    categoriesController.clear();
                    timeController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text("Add Expense".tr(context)),
              ),
            ),
          ),
        );
      },
    );
  }
}
