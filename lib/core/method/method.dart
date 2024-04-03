//فانكشن حصر التواريخ ثم  جمع الصرف
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';

Map<DateTime, double> getDailyExpenses(List<ExpensesModel> expensesModel) {
  // حصر التواريخ وجمع قيم كل يوم على حدة
  return expensesModel.fold(<DateTime, double>{}, (map, expense) {
    final date = expense.date!;
    final amount = expense.amount!;
    map[date] = (map[date] ?? 0) + amount;
    return map;
  });
}
