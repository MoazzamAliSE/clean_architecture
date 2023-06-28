import 'dart:convert';
import 'package:architecture/domain/entities/user.dart';
import 'package:architecture/domain/repository/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:architecture/data/user_json.dart';

class RestApiUserRepository implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    // final users = list.map((e) => UserJson.fromJson(e)).toList();
    return list.map((e) => UserJson.fromJson(e).toDomain()).toList();
  }
}
