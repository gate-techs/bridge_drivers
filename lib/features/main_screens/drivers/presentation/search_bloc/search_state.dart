part of 'search_bloc.dart';

enum SearchStates { init, loading, success, failed }

class DriversSearchState extends Equatable {
  final SearchStates status;
  final List<DriversDataRows?> data;
  final bool hasReachedMax;
  final String searchKeyWord;
  final String errorMessage;

  const DriversSearchState({
    this.status = SearchStates.init,
    this.data = const [],
    this.hasReachedMax = false,
    this.searchKeyWord = '',
    this.errorMessage = '',
  });

  DriversSearchState copyWith({
    SearchStates? status,
    List<DriversDataRows?>? data,
    bool? hasReachedMax,
    String? searchKeyWord,
    String? errorMessage,
  }) {
    return DriversSearchState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      searchKeyWord: searchKeyWord ?? this.searchKeyWord,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        hasReachedMax,
        searchKeyWord,
        errorMessage,
      ];
}
