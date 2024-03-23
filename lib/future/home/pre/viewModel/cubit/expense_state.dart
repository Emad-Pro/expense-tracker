part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  final RequestState getDatabaseExpansesState;
  final RequestState addExpenseItem;
  final List<ExpanseModelGetData>? getDatabaseExpansesModel;
  final double totalAmount;
  final String messageExpansesText;
  final List<String>? getMonthsExpense;
  final List<String>? categoriesItems;
  final Map<String, double>? categoriesTotalItem;
  const ExpenseState(
      {this.getDatabaseExpansesState = RequestState.loading,
      this.addExpenseItem = RequestState.loading,
      this.getDatabaseExpansesModel,
      this.messageExpansesText = '',
      this.totalAmount = 0,
      this.getMonthsExpense,
      this.categoriesItems,
      this.categoriesTotalItem});
  ExpenseState copyWith({
    RequestState? getDatabaseExpansesState,
    List<ExpanseModelGetData>? getDatabaseExpansesModel,
    double? totalAmount,
    String? messageExpansesText,
    List<String>? getMonthsExpense,
    Map<String, double>? categoriesTotalItem,
    List<String>? categoriesItems,
    RequestState? addExpenseItem,
  }) {
    return ExpenseState(
        messageExpansesText: messageExpansesText ?? this.messageExpansesText,
        getDatabaseExpansesModel:
            getDatabaseExpansesModel ?? this.getDatabaseExpansesModel,
        getDatabaseExpansesState:
            getDatabaseExpansesState ?? this.getDatabaseExpansesState,
        totalAmount: totalAmount ?? this.totalAmount,
        getMonthsExpense: getMonthsExpense ?? this.getMonthsExpense,
        categoriesItems: categoriesItems ?? this.categoriesItems,
        categoriesTotalItem: categoriesTotalItem ?? this.categoriesTotalItem,
        addExpenseItem: addExpenseItem ?? this.addExpenseItem);
  }

  @override
  List<Object?> get props => [
        getDatabaseExpansesModel,
        getDatabaseExpansesState,
        messageExpansesText,
        totalAmount,
        getMonthsExpense,
        categoriesItems,
        categoriesTotalItem,
        addExpenseItem,
      ];
}
