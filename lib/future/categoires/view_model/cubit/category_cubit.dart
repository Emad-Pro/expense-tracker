import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/database/isar_service.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.isarDataBase) : super(const CategoryState());
  final IsarDataBase isarDataBase;
  Future<List<ExpensesModel>?> fetchDataWithCategoryName(
      String categoryName) async {
    try {
      final result =
          await isarDataBase.getDataWithCategory(categoryName: categoryName);
      emit(state.copyWith(
          categoryModelData: result, categoryState: RequestState.sucess));
      return result;
    } catch (e) {
      emit(state.copyWith(
          erorrMessage: e.toString(), categoryState: RequestState.erorr));
    }
    return null;
  }

  deleteItemWithId(int id, String categoryName) async {
    await isarDataBase.deleteData(id);
    emit(state.copyWith(deleteItemState: RequestState.sucess));
    fetchDataWithCategoryName(categoryName);
  }
}
