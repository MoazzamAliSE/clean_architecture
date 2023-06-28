import '../domain/entities/user.dart';
import '../domain/repository/user_repository.dart';

class MockUsersRepository implements UserRepository {
  @override
  Future<List<User>> getUsers() async => [
        User(
          id: 123,
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ];
}
