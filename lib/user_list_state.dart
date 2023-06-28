part of 'user_list_cubit.dart';

class UserListState {
  final List<UserJson> users;
  final bool isLoading;
  UserListState({
    required this.users,
    required this.isLoading,
  });

  factory UserListState.empty() => UserListState(
        isLoading: false,
        users: [],
      );
  UserListState copyWith({List<UserJson>? users, bool? isLoading}) =>
      UserListState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
      );
}
