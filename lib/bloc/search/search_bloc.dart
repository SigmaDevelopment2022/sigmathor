import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/user.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<QueryTerm>((event, emit) {
      if (event.source.isEmpty || event.term.isEmpty) {
        emit(SearchInitial());
        return;
      }

      List<User> queriedData = [];

      event.source.map((data) {
        assertData(
          data: data,
          term: event.term,
          queriedData: queriedData,
          callback: (value) {
            queriedData = value;
          },
        );
      }).toList();

      if (queriedData.isEmpty) {
        emit(NoDataFound());
        return;
      }

      emit(QueriedData(queriedData));
    });
  }

  void assertData({
    required User data,
    required List<User> queriedData,
    required Function(List<User>) callback,
    required String term,
  }) {
    try {
      int code = int.parse(term);
      if (data.code == code && !queriedData.contains(data)) {
        queriedData.add(data);
      }

      if (data.team.code == code && !queriedData.contains(data)) {
        queriedData.add(data);
      }
      callback(queriedData);
    } on FormatException catch (e) {
      if (data.name.toLowerCase().contains(term.toLowerCase()) &&
          !queriedData.contains(data)) {
        queriedData.add(data);
      }

      if (data.team.name.toLowerCase().contains(term.toLowerCase()) &&
          !queriedData.contains(data)) {
        queriedData.add(data);
      }
      callback(queriedData);
    }
  }
}
