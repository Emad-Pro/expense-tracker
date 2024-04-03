import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/search/data/model/expenses_search_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class IsarDataBase {
  Future<void> initialize();
  Future<void> addData(ExpensesModel textFromUser);
  Future<List<ExpensesModel>> getData();
  Future<void> updateData(ExpensesModel expensesModel);
  Future<void> deleteData(int id);
  Future<List<ExpensesModel>> getDataWithMounth({int? year, int? month});
  Future<List<ExpensesModel>>? qureyExpenseMultiple(
      ExpenseSearchModel expenseSearchModel);
}

class IsarDataBaseImp extends IsarDataBase {
  static late Isar isar;
  // Initialize Isar DataBase
  @override
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpensesModelSchema], directory: dir.path);
  }

  // Create A Note and save to db
  @override
  Future<void> addData(ExpensesModel textFromUser) async {
    final newNote = ExpensesModel() = textFromUser;
    await isar
        .writeTxn(() => isar.expensesModels.put(newNote))
        .then((value) {})
        .catchError((onError) {});
  }

  // get Data from db
  @override
  Future<List<ExpensesModel>> getData() async {
    return await isar.expensesModels.where().sortByDate().findAll();
  }

// Update Data from db
  @override
  Future<void> updateData(ExpensesModel expensesModel) async {
    final existingNote = await isar.expensesModels.get(expensesModel.id);
    if (existingNote != null) {
      existingNote.description = expensesModel.description!;
      await isar.writeTxn(() => isar.expensesModels.put(existingNote));
    }
  }

// Delete Data from db
  @override
  Future<void> deleteData(int id) async {
    await isar.writeTxn(() => isar.expensesModels.delete(id));
  }

  @override
  Future<List<ExpensesModel>> getDataWithMounth({int? year, int? month}) async {
    final startDate = DateTime(year!, month!, 1);
    final endDate = DateTime(year, month, 31);

    final expensesModel = await isar.expensesModels
        .filter()
        .dateBetween(startDate, endDate)
        .sortByDate()
        .findAll();

    return expensesModel;
  }

  @override
  Future<List<ExpensesModel>>? qureyExpenseMultiple(
      ExpenseSearchModel expenseSearchModel) async {
    final expensesModel = await isar.expensesModels
        .filter()
        .descriptionContains(expenseSearchModel.description ?? '')
        .categoriesContains(expenseSearchModel.category ?? '')
        .amountBetween(
            expenseSearchModel.startAmount, expenseSearchModel.endAmount)
        .dateBetween(expenseSearchModel.endDate, expenseSearchModel.startDate)
        .findAll();

    return expensesModel;
  }

  Future<void> deleteAllData() async {
    await isar.writeTxn(() => isar.expensesModels.clear());
  }
}
