part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class QueriedData extends SearchState {
  final List<User> data;

  QueriedData(this.data);
}

class NoDataFound extends SearchState {}
