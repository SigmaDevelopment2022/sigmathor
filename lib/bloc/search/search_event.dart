part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class QueryTerm extends SearchEvent {
  final List<User> source;
  final String term;

  QueryTerm({required this.term, required this.source});
}
