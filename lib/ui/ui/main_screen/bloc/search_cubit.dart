import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  bool checkSearch() {
    return state.searchEnabled == true;
  }

  void changeNabBarStatus({required bool newStatus}) {
    emit(
      state.copyWith(
        hideNavBar: newStatus,
      ),
    );
  }

  void returningEnabled({required bool newStatus}) {
    emit(
      state.copyWith(
        enableReturning: newStatus,
      ),
    );
  }

  void enableSearch(String screen) {
    emit(
      state.copyWith(
        searchEnabled: true,
        hideNavBar: true,
      ),
    );
  }

  void clearQuery() {
    emit(
      state.copyWith(
        query: '',
        searchEnabled: false,
        hideNavBar: false,
      ),
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onTextChanged(String value) {
    emit(
      state.copyWith(
        query: value,
      ),
    );
  }

  void disableSearch() {
    emit(
      state.copyWith(
        hideNavBar: false,
        searchEnabled: state.query?.isNotEmpty == true ? true : false,
      ),
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
