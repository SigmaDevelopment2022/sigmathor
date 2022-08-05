part of 'user_list_bloc.dart';

@immutable
abstract class UserListState {}

class UserListInitial extends UserListState {}

class LoadedUsers extends UserListState {
  final List<User> data;

  LoadedUsers(this.data);
}

class LoadingUsers extends UserListState {}

class FailureToLoad extends UserListState {
  final String message;

  FailureToLoad(this.message);
}

class NoUsersFound extends UserListState {}
