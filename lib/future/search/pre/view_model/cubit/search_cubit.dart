import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/isar_service.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/search/data/model/expenses_search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._isarDataBase) : super(const SearchState());
  final IsarDataBase _isarDataBase;
  changeValueCategoryDropDown(String value) {
    emit(state.copyWith(categoryValue: value));
  }

  multipleSearchMethod(ExpenseSearchModel expenseSearchModel) async {
    try {
      final result =
          await _isarDataBase.qureyExpenseMultiple(expenseSearchModel);
      emit(state.copyWith(
        searchBoxGetDataModel: result,
        searchBoxGetDataState: RequestState.sucess,
      ));
    } catch (e) {
      emit(state.copyWith(
          searchBoxGetDataState: RequestState.erorr,
          searchBoxGetDataErorrMessage: e.toString()));
    }
  }
}
