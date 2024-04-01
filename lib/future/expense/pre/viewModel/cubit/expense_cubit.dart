import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/isar_service.dart';

import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/method_calc_amount.dart';
import 'package:expense_tracker/core/method_date.dart';

import 'package:expense_tracker/core/expenses_model/expenses_model.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.isarDataBase) : super(const ExpenseState());
  final IsarDataBase isarDataBase;
  List<String> categories = ['Food', 'Medical', 'Shopping', 'Other'];
  List<String> getMonthsYear = [];
  String initialValue = '';
  getDataInit({int? month, int? year}) {
    if (month != null && year != null) {
      getDataFromDatabaseWithMounth(month, year);
    } else {
      getDataFromDatabase();
    }
  }

  getDataFromDatabase() async {
    await isarDataBase.getData().then((value) {
      getMonthsYear = getMonthsYears(value);
      getMonthsYear.add("all");
      emit(
        state.copyWith(
          categoriesTotalItem: calculateCategoryTotals(value),
          categoriesItems: getCategoriesItem(value),
          totalAmount: calcTotalAmountMethod(value),
          getExpansesModel: value.reversed.toList(),
          getDatabaseExpansesState: RequestState.sucess,
        ),
      );
    });
  }

  getDataFromDatabaseWithMounth(int month, int year) async {
    await isarDataBase.getDataWithMounth(year, month).then((value) {
      emit(
        state.copyWith(
          categoriesTotalItem: calculateCategoryTotals(value),
          categoriesItems: getCategoriesItem(value),
          totalAmount: calcTotalAmountMethod(value),
          getExpansesModel: value.reversed.toList(),
          getDatabaseExpansesState: RequestState.sucess,
          // getMonthsExpense: getMonthsYears(value),
        ),
      );
    });
  }

  addNewDataFromDatabase(ExpensesModel expanseModel) async {
    await isarDataBase.addData(expanseModel).then(
      (value) {
        emit(state.copyWith(addExpenseItem: RequestState.sucess));
        getDataFromDatabase();
      },
    ).catchError(
      (onError) {},
    );
  }

  updateDataFromDatabase(ExpensesModel expensesModel) async {
    await isarDataBase
        .updateData(expensesModel)
        .then(
          (value) {},
        )
        .catchError(
          (onError) {},
        );
  }

  deleteDataFromDatabase(int id) async {
    await isarDataBase
        .deleteData(id)
        .then(
          (value) {},
        )
        .catchError(
          (onError) {},
        );
  }
}
