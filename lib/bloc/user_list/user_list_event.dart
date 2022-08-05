part of 'user_list_bloc.dart';

@immutable
abstract class UserListEvent {}

class ULELoadUsers extends UserListEvent {
  late final ListUsersParams params;

  ULELoadUsers(this.params);
}
