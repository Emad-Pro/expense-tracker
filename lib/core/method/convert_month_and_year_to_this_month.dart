import 'package:expense_tracker/core/method/parse_year_and_month_to_Int.dart';

String convertMonthAndYearToThisMonth(String value) {
  if (value != "all") {
    int month = parseDate(value)["month"]!;
    int year = parseDate(value)["year"]!;
    if (month == DateTime.now().month && year == DateTime.now().year) {
      return "This month";
    } else {
      return value;
    }
  }
  return value;
}
