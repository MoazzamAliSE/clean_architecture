import 'package:architecture/ui/userList/user_list_cubit.dart';
import 'package:architecture/ui/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UserListCubit>(context),
          builder: (context, state) {
            final userState = state as UserListState;
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: userState.users
                        .map((user) => UserCard(
                              user: user,
                            ))
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}




// BlocBuilder(
//           bloc = BlocProvider.of<UsersListCubit>(context),
//           builder = (context, state) {
//             final userState = state as UsersListState;
//             return userState.isLoading
//                 ? const CircularProgressIndicator()
//                 : ListView(
//                     children: userState.users.map((user) => UserCard(user: user)).toList(),
//                   );
//           },
//         ),