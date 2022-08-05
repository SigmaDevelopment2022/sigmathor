part of 'selected_user_bloc.dart';

@immutable
abstract class SelectedUserState {}

class SelectedUserInitial extends SelectedUserState {}

class SelectedUser extends SelectedUserState {
  final User user;

  SelectedUser(this.user);
}


