import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sigmathor/domain/user.dart';

part 'selected_user_event.dart';

part 'selected_user_state.dart';

class SelectedUserBloc extends Bloc<SelectedUserEvent, SelectedUserState> {
  SelectedUserBloc() : super(SelectedUserInitial()) {
    on<SelectUser>((event, emit) {
      emit(SelectedUser(event.user));
    });

    on<UnselectUser>((event, emit) {
      emit(SelectedUserInitial());
    });
  }
}
