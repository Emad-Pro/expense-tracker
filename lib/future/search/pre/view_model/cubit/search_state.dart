part of 'search_cubit.dart';

class SearchState extends Equatable {
  final String? categoryValue;

  SearchState({this.categoryValue});

  SearchState copyWith({String? categoryValue}) {
    return SearchState(categoryValue: categoryValue ?? this.categoryValue);
  }

  @override
  List<Object?> get props => [categoryValue];
}
