part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  final RequestState getDatabaseExpansesState;
  final List<ExpanseModelGetData>? getDatabaseExpansesModel;
  final double totalAmount;
  final String messageExpansesText;

  const ExpenseState(
      {this.getDatabaseExpansesState = RequestState.loading,
      this.getDatabaseExpansesModel,
      this.messageExpansesText = '',
      this.totalAmount = 0});
  ExpenseState copyWith(
      {RequestState? getDatabaseExpansesState,
      List<ExpanseModelGetData>? getDatabaseExpansesModel,
      double? totalAmount,
      String? messageExpansesText}) {
    return ExpenseState(
        messageExpansesText: messageExpansesText ?? this.messageExpansesText,
        getDatabaseExpansesModel:
            getDatabaseExpansesModel ?? this.getDatabaseExpansesModel,
        getDatabaseExpansesState:
            getDatabaseExpansesState ?? this.getDatabaseExpansesState,
        totalAmount: totalAmount ?? this.totalAmount);
  }

  @override
  List<Object?> get props => [
        getDatabaseExpansesModel,
        getDatabaseExpansesState,
        messageExpansesText,
        totalAmount
      ];
}
