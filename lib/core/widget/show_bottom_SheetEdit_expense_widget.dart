import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/amount_expense_textFormFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/description_expense_textFormFiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBottomSheetEditExpenseWidget extends StatelessWidget {
  ShowBottomSheetEditExpenseWidget({super.key, required this.expensesModel});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ExpensesModel expensesModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        amountController.text = expensesModel.amount.toString();
        descriptionController.text = expensesModel.description!;

        return Container(
          padding: MediaQuery.of(context)
              .padding
              .copyWith(top: 10, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.background),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit expense".tr(context),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Edit your expense details data".tr(context),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                AmountExpenseTextFormFiledWidget(
                  amountController: amountController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "please Enter Amount Expense".tr(context);
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionExpenseTextFormFiledWidget(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please Enter Description Expense".tr(context);
                      } else {
                        return null;
                      }
                    },
                    descriptionController: descriptionController),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(top: 0, bottom: 5),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<ExpenseCubit>(context)
                                .updateDataFromDatabase(
                              ExpensesModel()
                                ..id = expensesModel.id
                                ..amount = double.parse(amountController.text)
                                ..categories = expensesModel.categories
                                ..time = expensesModel.time
                                ..date = expensesModel.date
                                ..description = descriptionController.text,
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: Text("update".tr(context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
