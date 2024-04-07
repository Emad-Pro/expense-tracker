part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final List<ExpensesModel>? categoryModelData;
  final RequestState categoryState;
  final String erorrMessage;
  final RequestState deleteItemState;

  const CategoryState(
      {this.categoryModelData,
      this.categoryState = RequestState.loading,
      this.erorrMessage = '',
      this.deleteItemState = RequestState.loading});

  CategoryState copyWith(
      {List<ExpensesModel>? categoryModelData,
      RequestState? categoryState,
      String? erorrMessage,
      RequestState? deleteItemState}) {
    return CategoryState(
        erorrMessage: erorrMessage ?? this.erorrMessage,
        categoryModelData: categoryModelData ?? this.categoryModelData,
        categoryState: categoryState ?? this.categoryState,
        deleteItemState: deleteItemState ?? this.deleteItemState);
  }

  @override
  List<Object?> get props =>
      [categoryState, categoryModelData, erorrMessage, deleteItemState];
}
