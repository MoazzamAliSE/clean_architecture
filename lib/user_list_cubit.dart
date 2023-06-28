import 'package:architecture/user_json.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListState.empty());

  fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    final users = list.map((e) => UserJson.fromJson(e)).toList();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
