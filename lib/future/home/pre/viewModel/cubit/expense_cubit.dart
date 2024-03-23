import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/sqflite_service.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/method_calc_amount.dart';
import 'package:expense_tracker/core/method_date.dart';
import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/home/data/model/expense_model.dart';
import 'package:intl/intl.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.databaseSqfliteService) : super(const ExpenseState());
  final DatabaseSqfliteService databaseSqfliteService;
  List<String> categories = ['Food', 'Medical', 'Shopping', 'Other'];

  getDataFromDatabase() async {
    await databaseSqfliteService.getAllData().then(
      (value) {
        emit(
          state.copyWith(
            categoriesTotalItem: calculateCategoryTotals(value),
            categoriesItems: getCategoriesItem(value),
            totalAmount: calcTotalAmountMethod(value),
            getDatabaseExpansesModel: value,
            getDatabaseExpansesState: RequestState.sucess,
            getMonthsExpense: getMonthsYears(value),
          ),
        );
      },
    ).catchError((onError) {
      emit(
        state.copyWith(
          getDatabaseExpansesState: RequestState.sucess,
          messageExpansesText: onError.toString(),
        ),
      );
    });
  }

  addNewDataFromDatabase(ExpanseModel expanseModel) async {
    await databaseSqfliteService.addData(expanseModel).then(
      (value) {
        emit(state.copyWith(addExpenseItem: RequestState.sucess));
        getDataFromDatabase();
      },
    ).catchError(
      (onError) {},
    );
  }

  updateDataFromDatabase(ExpanseModelGetData expanseModelGetData) async {
    await databaseSqfliteService
        .updateData(expanseModelGetData)
        .then(
          (value) {},
        )
        .catchError(
          (onError) {},
        );
  }

  deleteDataFromDatabase(int id) async {
    await databaseSqfliteService
        .deleteData(id)
        .then(
          (value) {},
        )
        .catchError(
          (onError) {},
        );
  }
}
