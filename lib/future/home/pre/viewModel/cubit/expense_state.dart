part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  final RequestState getDatabaseExpansesState;
  final List<ExpanseModelGetData>? getDatabaseExpansesModel;
  final double totalAmount;
  final String messageExpansesText;
  final List<String>? getMonthsExpense;

  const ExpenseState(
      {this.getDatabaseExpansesState = RequestState.loading,
      this.getDatabaseExpansesModel,
      this.messageExpansesText = '',
      this.totalAmount = 0,
      this.getMonthsExpense});
  ExpenseState copyWith(
      {RequestState? getDatabaseExpansesState,
      List<ExpanseModelGetData>? getDatabaseExpansesModel,
      double? totalAmount,
      String? messageExpansesText,
      List<String>? getMonthsExpense}) {
    return ExpenseState(
        messageExpansesText: messageExpansesText ?? this.messageExpansesText,
        getDatabaseExpansesModel:
            getDatabaseExpansesModel ?? this.getDatabaseExpansesModel,
        getDatabaseExpansesState:
            getDatabaseExpansesState ?? this.getDatabaseExpansesState,
        totalAmount: totalAmount ?? this.totalAmount,
        getMonthsExpense: getMonthsExpense ?? this.getMonthsExpense);
  }

  @override
  List<Object?> get props => [
        getDatabaseExpansesModel,
        getDatabaseExpansesState,
        messageExpansesText,
        totalAmount,
        getMonthsExpense
      ];
}
