import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:intl/intl.dart';

DateTime? _parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  try {
    print(dateString);
    print(DateFormat('EEE, MM/DD/yyyy').parse(dateString));
    return DateFormat('EEE, MM/DD/yyyy').parse(dateString);
  } catch (e) {
    return null;
  }
}

List<String> getMonthsYears(List<ExpanseModelGetData> list) {
  Set<String> uniqueMonthsYears = {};
  for (ExpanseModelGetData item in list) {
    DateTime? date = _parseDate(item.date);
    if (date != null) {
      String monthYear = DateFormat.yMMM().format(date);
      uniqueMonthsYears.add(monthYear);
    }
  }
  return uniqueMonthsYears.toList();
}

List<String> getCategoriesItem(List<ExpanseModelGetData> list) {
  Set<String> uniqueCategories = {};
  for (ExpanseModelGetData item in list) {
    if (item.categories != null) {
      uniqueCategories.add(item.categories!);
    }
  }
  return uniqueCategories.toList();
}

Map<String, double> calculateCategoryTotals(
    List<ExpanseModelGetData> expenses) {
  Map<String, double> categoryTotals = {};

  for (var expense in expenses) {
    if (expense.categories != null && expense.amount != null) {
      try {
        double amount = double.parse(expense.amount!);
        categoryTotals.update(expense.categories!, (value) => value + amount,
            ifAbsent: () => amount);
      } on FormatException catch (e) {
        print("خطأ في تنسيق المبلغ: ${expense.amount}");
      }
    }
  }
  print(categoryTotals);
  return categoryTotals;
}
