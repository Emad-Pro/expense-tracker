import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/amount_expense_textFormFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/button_add_expense_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/dateAndTimePicer_expense_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/description_expense_textFormFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/dropdown_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBottomSheetWidget extends StatelessWidget {
  ShowBottomSheetWidget({
    super.key,
    required this.amountController,
    required this.descriptionController,
    required this.categoriesController,
    required this.dateController,
    required this.timeController,
  });

  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final TextEditingController categoriesController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(builder: (context, state) {
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
                "add a new expense".tr(context),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "enter the details of your expense to help you track your spending"
                    .tr(context),
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
              DropDownCategoriesWidget(
                  categoriesController: categoriesController),
              DateAndTimePicerExpenseWidget(
                  dateController: dateController,
                  timeController: timeController),
              ButtonAddExpenseWidget(
                  descriptionController: descriptionController,
                  amountController: amountController,
                  dateController: dateController,
                  categoriesController: categoriesController,
                  timeController: timeController,
                  formkey: formKey)
            ],
          ),
        ),
      );
    });
  }
}