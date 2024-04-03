import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/isar_service.dart';

import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/method/method_calc_amount.dart';
import 'package:expense_tracker/core/method/method_date.dart';

import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/expense/data/model/date_model.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.isarDataBase) : super(const ExpenseState());
  final IsarDataBase isarDataBase;
  List<String> getMonthsYear = [];
  String initialValue = '';

  getDataFromDatabase({DateModel? dateModel}) async {
    if (dateModel == null) {
      await isarDataBase.getData().then((value) async {
        getMonthsYear = getMonthsYears(value);
        await isarDataBase
            .getDataWithMounth(
                month: DateTime.now().month, year: DateTime.now().year)
            .then((value) {
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
      });
    } else {
      await isarDataBase
          .getDataWithMounth(month: dateModel.month!, year: dateModel.year!)
          .then((newValue) {
        emit(
          state.copyWith(
            categoriesTotalItem: calculateCategoryTotals(newValue),
            categoriesItems: getCategoriesItem(newValue),
            totalAmount: calcTotalAmountMethod(newValue),
            getExpansesModel: newValue.reversed.toList(),
            getDatabaseExpansesState: RequestState.sucess,
          ),
        );
      });
    }
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
