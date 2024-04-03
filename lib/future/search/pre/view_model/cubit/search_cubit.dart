import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  changeValueCategoryDropDown(String value) {
    emit(state.copyWith(categoryValue: value));
  }
}
