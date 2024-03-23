import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/amount_expense_textFormFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/button_add_expense_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/dateAndTimePicer_expense_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/description_expense_textFormFiled_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/dropdown_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddExpenseItem extends StatelessWidget {
  AddExpenseItem({
    super.key,
  });
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dateController.text = DateFormat.yMEd().format(DateTime.now()).toString();
    timeController.text = DateFormat.Hm().format(DateTime.now()).toString();
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent[700]),
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.none,
                style: AlertStyle(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    isCloseButton: false,
                    isButtonVisible: false),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "add new expense",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "enter the details of your expense to help you track your spending",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AmountExpenseTextFormFiledWidget(
                        amountController: amountController),
                    const SizedBox(
                      height: 10,
                    ),
                    DescriptionExpenseTextFormFiledWidget(
                        descriptionController: descriptionController),
                    const SizedBox(
                      height: 10,
                    ),
                    DropDownCategoriesWidget(
                        categoriesController: categoriesController),
                    DateAndTimePicerExpenseWidget(
                        dateController: dateController,
                        timeController: timeController),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonAddExpenseWidget(
                        descriptionController: descriptionController,
                        amountController: amountController,
                        dateController: dateController,
                        categoriesController: categoriesController,
                        timeController: timeController)
                  ],
                ),
              ).show();
            },
            child: Text(
              "Add Expenses",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground),
            )),
      ),
    );
  }
}
