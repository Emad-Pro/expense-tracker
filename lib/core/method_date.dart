import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:intl/intl.dart';

DateTime? _parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  try {
    return DateFormat('EEE, dd/MM/yyyy').parse(dateString);
  } catch (e) {
    return null;
  }
}

List<String> getMonthsYears(List<ExpanseModelGetData> list) {
  Set<String> uniqueMonthsYears = {};
  for (ExpanseModelGetData item in list) {
    DateTime? date = _parseDate(item.date);
    if (date != null) {
      // استخراج الشهر والسنة
      String monthYear = DateFormat.yMMM().format(date);
      uniqueMonthsYears.add(monthYear);
    }
  }
  return uniqueMonthsYears.toList();
}
