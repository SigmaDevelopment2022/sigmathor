import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sigmathor/datasource/sigmathor_api_datasource.dart';
import 'package:sigmathor/param/list_users_param.dart';

import '../../domain/user.dart';
import '../../util/date_format_extension.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  ISigmathorApiDatasource datasource = SigmathorApiDatasource();

  UserListBloc() : super(UserListInitial()) {
    on<ULELoadUsers>((event, emit) async {
      emit(LoadingUsers());

      var response = await datasource.listUsers(assertParams(event));

      response.fold((error) {
        emit(FailureToLoad(error));
      }, (success) {
        emit(LoadedUsers(success));
      });
    });
  }

  ListUsersParams assertParams(ULELoadUsers event) {
    var today = DateTime.now();

    var lastDay = DateTime(
      today.year,
      today.month,
      DateTime(today.year, today.month + 1, 0).day,
    );

    var firstDay = DateTime(today.year, today.month, 1);

    if (event.params.initialDate.isEmpty == true) {
      event.params.initialDate = firstDay.format();
    }

    if (event.params.finalDate.isEmpty == true) {
      event.params.finalDate = lastDay.format();
    }

    if (event.params.todayDate.isEmpty == true) {
      event.params.todayDate = today.format();
    }

    return event.params;
  }
}
