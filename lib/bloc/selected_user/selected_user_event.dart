part of 'selected_user_bloc.dart';

@immutable
abstract class SelectedUserEvent {}

class SelectUser extends SelectedUserEvent {
  final User user;

  SelectUser(this.user);
}

class UnselectUser extends SelectedUserEvent {}
