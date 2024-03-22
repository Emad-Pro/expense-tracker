import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';

double calcTotalAmountMethod(
  List<ExpanseModelGetData> value,
) {
  double totalAmount = 0;
  for (var expense in value) {
    if (expense.amount != null) {
      totalAmount += double.parse(expense.amount!);
    }
  }
  return totalAmount;
}
