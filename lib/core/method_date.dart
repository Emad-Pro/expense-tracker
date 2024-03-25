import 'package:expense_tracker/future/expense/data/model/expanse_model_getData.dart';
import 'package:intl/intl.dart';

DateTime? _parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  try {
    return DateFormat('dd , MMM, yyy').parse(dateString);
  } catch (e) {
    return null;
  }
}

List<String> getMonthsYears(List<ExpanseModelGetData> list) {
  Set<String> uniqueMonthsYears = {};
  for (ExpanseModelGetData item in list) {
    DateTime? date = _parseDate(item.date);
    if (date != null) {
      uniqueMonthsYears.add(DateFormat('MMM, yyy').format(date));
    }
  }
  return uniqueMonthsYears.toList();
}

String convertDateToYearMounth(String date) {
  String dateConverted = '';

  DateTime? dateTime = DateFormat('yyyy-MM-dd').parse(date);
  dateConverted = DateFormat.yMMM().format(dateTime).toString();
  return dateConverted;
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
