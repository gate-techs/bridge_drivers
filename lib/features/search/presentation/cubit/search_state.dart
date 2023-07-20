part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MyOrdersDataRows> mDataList;

  const SearchLoaded(this.mDataList);
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);
}
