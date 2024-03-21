import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/sqflite_service.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/home/data/model/expense_model.dart';
import 'package:flutter/foundation.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit(this.databaseSqfliteService) : super(const ExpenseState());
  final DatabaseSqfliteService databaseSqfliteService;
  List<String> categories = ['Food', 'Medical', 'Shopping', 'Other'];
  getDataFromDatabase() async {
    await databaseSqfliteService.getAllData().then(
      (value) {
        double totalAmount = 0;
        for (var expense in value) {
          if (expense.amount != null) {
            totalAmount += double.parse(expense.amount!);
          }
        }

        emit(
          state.copyWith(
              totalAmount: totalAmount,
              getDatabaseExpansesModel: value,
              getDatabaseExpansesState: RequestState.sucess),
        );
      },
    ).catchError((onError) {
      emit(state.copyWith(
          getDatabaseExpansesState: RequestState.sucess,
          messageExpansesText: onError.toString()));
    });
  }

  addNewDataFromDatabase(ExpanseModel expanseModel) async {
    await databaseSqfliteService.addData(expanseModel).then(
      (value) {
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
