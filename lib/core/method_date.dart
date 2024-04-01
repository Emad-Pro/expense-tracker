import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';

List<String> getMonthsYears(List<ExpensesModel> list) {
  Set<String> uniqueMonthsYears = {};
  for (ExpensesModel item in list) {
    DateTime? date = item.date;
    print(item.date);

    uniqueMonthsYears.add(DateFormat('MMM, yyy').format(date!));
  }

  return uniqueMonthsYears.toList();
}

String convertDateToYearMounth(String date) {
  String dateConverted = '';

  DateTime? dateTime = DateFormat('yyyy-MM-dd').parse(date);
  dateConverted = DateFormat.yMMM().format(dateTime).toString();
  return dateConverted;
}

List<String> getCategoriesItem(List<ExpensesModel> list) {
  Set<String> uniqueCategories = {};
  for (ExpensesModel item in list) {
    if (item.categories != null) {
      uniqueCategories.add(item.categories!);
    }
  }
  return uniqueCategories.toList();
}

Map<String, double> calculateCategoryTotals(List<ExpensesModel> expenses) {
  Map<String, double> categoryTotals = {};

  for (var expense in expenses) {
    if (expense.categories != null && expense.amount != null) {
      try {
        double amount = expense.amount!;
        categoryTotals.update(expense.categories!, (value) => value + amount,
            ifAbsent: () => amount);
      } on FormatException catch (e) {
        if (kDebugMode) {
          print("خطأ في تنسيق المبلغ: ${expense.amount}");
        }
      }
    }
  }
  print(categoryTotals);
  return categoryTotals;
}

String convertDateToDayYearMounth(String date) {
  String dateConverted = '';

  DateTime? dateTime = DateFormat('yyyy-MM-dd').parse(date);
  dateConverted = DateFormat.yMMMd().format(dateTime).toString();
  return dateConverted;
}

String convertTime(String time) {
  DateTime? dateTime = DateTime.parse(time);
  final dateFormat = DateFormat('h:m');
  final formattedDateTime = dateFormat.format(dateTime);
  return formattedDateTime;
}
