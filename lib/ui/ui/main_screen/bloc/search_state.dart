part of 'search_cubit.dart';

class SearchState {
  SearchState({
    this.searchEnabled,
    this.query,
    this.focusOnTextField,
    this.enableReturning,
  });

  bool? searchEnabled = false;
  String? query = '';
  bool? focusOnTextField = false;
  bool? enableReturning = false;

  // PersistentTabController? controller=PersistentTabController(initialIndex: 2);

  SearchState copyWith({
    bool? navBarShow,
    bool? searchEnabled,
    bool? hideNavBar,
    bool? enableReturning,
    String? query,
  }) {
    // controller.text=(query ?? this.query)!;
    return SearchState(
        searchEnabled: searchEnabled ?? this.searchEnabled,
        query: query ?? this.query,
        focusOnTextField: hideNavBar ?? focusOnTextField,
        enableReturning: enableReturning ?? this.enableReturning);
  }
}
