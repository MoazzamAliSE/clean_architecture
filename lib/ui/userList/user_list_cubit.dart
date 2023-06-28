import 'package:architecture/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architecture/data/user_json.dart';
import '../../data/rest_api_user_repository.dart';
import '../../domain/entities/user.dart';
part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserRepository userRepository;
  UserListCubit(this.userRepository) : super(UserListState.empty());
  // UserRepository userRepository = UserRepository();
  fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    final users = await userRepository.getUsers();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
