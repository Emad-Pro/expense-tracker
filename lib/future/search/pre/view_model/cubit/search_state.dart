part of 'search_cubit.dart';

class SearchState extends Equatable {
  final String? categoryValue;
  final RequestState searchBoxGetDataState;
  final List<ExpensesModel>? searchBoxGetDataModel;
  final String searchBoxGetDataErorrMessage;
  const SearchState({
    this.categoryValue,
    this.searchBoxGetDataState = RequestState.loading,
    this.searchBoxGetDataModel,
    this.searchBoxGetDataErorrMessage = "",
  });

  SearchState copyWith({
    String? categoryValue,
    RequestState? searchBoxGetDataState,
    List<ExpensesModel>? searchBoxGetDataModel,
    String? searchBoxGetDataErorrMessage,
  }) {
    return SearchState(
      categoryValue: categoryValue ?? this.categoryValue,
      searchBoxGetDataState:
          searchBoxGetDataState ?? this.searchBoxGetDataState,
      searchBoxGetDataModel:
          searchBoxGetDataModel ?? this.searchBoxGetDataModel,
      searchBoxGetDataErorrMessage:
          searchBoxGetDataErorrMessage ?? this.searchBoxGetDataErorrMessage,
    );
  }

  @override
  List<Object?> get props => [
        categoryValue,
        searchBoxGetDataState,
        searchBoxGetDataModel,
        searchBoxGetDataErorrMessage
      ];
}
