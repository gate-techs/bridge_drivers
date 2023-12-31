part of 'search_bloc.dart';

enum SearchStates { init, loading, success, failed }

class OrdersSearchState extends Equatable {
  final SearchStates status;
  final List<OrdersDataRows?> data;
  final bool hasReachedMax;
  final String searchKeyWord;
  final String errorMessage;

  const OrdersSearchState({
    this.status = SearchStates.init,
    this.data = const [],
    this.hasReachedMax = false,
    this.searchKeyWord = '',
    this.errorMessage = '',
  });

  OrdersSearchState copyWith({
    SearchStates? status,
    List<OrdersDataRows?>? data,
    bool? hasReachedMax,
    String? searchKeyWord,
    String? errorMessage,
  }) {
    return OrdersSearchState(
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
