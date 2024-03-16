part of 'expense_cubit.dart';

class ExpenseState extends Equatable {
  final RequestState getDatabaseExpansesState;
  final List<ExpanseModel>? getDatabaseExpansesModel;
  final String messageExpansesText;

  const ExpenseState(
      {this.getDatabaseExpansesState = RequestState.loading,
      this.getDatabaseExpansesModel,
      this.messageExpansesText = ''});
  ExpenseState copyWith(
      {RequestState? getDatabaseExpansesState,
      List<ExpanseModel>? getDatabaseExpansesModel,
      String? messageExpansesText}) {
    return ExpenseState(
        messageExpansesText: messageExpansesText ?? this.messageExpansesText,
        getDatabaseExpansesModel:
            getDatabaseExpansesModel ?? this.getDatabaseExpansesModel,
        getDatabaseExpansesState:
            getDatabaseExpansesState ?? this.getDatabaseExpansesState);
  }

  @override
  List<Object?> get props =>
      [getDatabaseExpansesModel, getDatabaseExpansesState, messageExpansesText];
}
