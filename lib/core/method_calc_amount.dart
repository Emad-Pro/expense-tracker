import 'package:expense_tracker/core/expenses_model/expenses_model.dart';

double calcTotalAmountMethod(
  List<ExpensesModel> value,
) {
  double totalAmount = 0;
  for (var expense in value) {
    totalAmount += expense.amount!;
  }
  return totalAmount;
}
