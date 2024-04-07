part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  final RequestState getDatabaseExpansesState; //
  final RequestState addExpenseItem; //
  final List<ExpensesModel>? getExpansesModel; //
  final double totalAmount; //
  final String messageExpansesText; //
  final List<String>? getMonthsExpense;
  final List<String>? categoriesItems; //
  final Map<String, double>? categoriesTotalItem; //
  final RequestState deleteExpensesData;
  const ExpenseState({
    this.getDatabaseExpansesState = RequestState.loading,
    this.addExpenseItem = RequestState.loading,
    this.getExpansesModel,
    this.totalAmount = 0,
    this.messageExpansesText = '',
    this.getMonthsExpense,
    this.categoriesItems,
    this.categoriesTotalItem,
    this.deleteExpensesData = RequestState.loading,
  });
  ExpenseState copyWith(
      {RequestState? getDatabaseExpansesState,
      List<ExpensesModel>? getExpansesModel,
      double? totalAmount,
      String? messageExpansesText,
      List<String>? getMonthsExpense,
      Map<String, double>? categoriesTotalItem,
      List<String>? categoriesItems,
      RequestState? addExpenseItem,
      RequestState? deleteExpensesData}) {
    return ExpenseState(
        messageExpansesText: messageExpansesText ?? this.messageExpansesText,
        getExpansesModel: getExpansesModel ?? this.getExpansesModel,
        getDatabaseExpansesState:
            getDatabaseExpansesState ?? this.getDatabaseExpansesState,
        totalAmount: totalAmount ?? this.totalAmount,
        getMonthsExpense: this.getMonthsExpense ?? getMonthsExpense,
        categoriesItems: categoriesItems ?? this.categoriesItems,
        categoriesTotalItem: categoriesTotalItem ?? this.categoriesTotalItem,
        addExpenseItem: addExpenseItem ?? this.addExpenseItem,
        deleteExpensesData: deleteExpensesData ?? this.deleteExpensesData);
  }

  @override
  List<Object?> get props => [
        getExpansesModel,
        getDatabaseExpansesState,
        messageExpansesText,
        totalAmount,
        getMonthsExpense,
        categoriesItems,
        categoriesTotalItem,
        addExpenseItem,
        deleteExpensesData
      ];
}
