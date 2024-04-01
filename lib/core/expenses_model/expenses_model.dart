import 'package:isar/isar.dart';
part 'expenses_model.g.dart';

@Collection()
class ExpensesModel {
  Id id = Isar.autoIncrement;
  String? description;
  double? amount;
  DateTime? date;
  DateTime? time;
  String? categories;
}
