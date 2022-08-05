import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigmathor/bloc/user_list/user_list_bloc.dart';
import 'package:sigmathor/param/list_users_param.dart';
import 'package:sigmathor/screen/home/widget/about_me_app.dart';
import 'package:sigmathor/screen/home/widget/search_bar.dart';
import 'package:sigmathor/screen/home/widget/user_info_dialog.dart';
import 'package:sigmathor/screen/home/widget/user_list.dart';

import '../../bloc/search/search_bloc.dart';
import '../../bloc/selected_user/selected_user_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserListBloc userListBloc;
  late final SelectedUserBloc selectedUserBloc;
  late final SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    userListBloc = UserListBloc()..add(ULELoadUsers(ListUsersParams()));
    selectedUserBloc = SelectedUserBloc();
    searchBloc = SearchBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: userListBloc),
        BlocProvider.value(value: selectedUserBloc),
        BlocProvider.value(value: searchBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Sigmathor",
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AboutMeDialog(),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black54,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                userListBloc.add(ULELoadUsers(ListUsersParams()));
              },
              icon: const Icon(Icons.refresh, color: Colors.black54),
            )
          ],
        ),
        body: BlocListener<SelectedUserBloc, SelectedUserState>(
          listener: (context, state) {
            if (state is SelectedUser) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return UserInfoDialog(
                      user: state.user,
                      onClose: () {
                        selectedUserBloc.add(UnselectUser());
                      },
                    );
                  });
            } else {
              Navigator.of(context).pop();
            }
          },
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<UserListBloc, UserListState>(
                  bloc: userListBloc,
                  builder: (context, state) {
                    if (state is LoadedUsers) {
                      return SearchBar(data: state.data);
                    }
                    return const SearchBar(data: []);
                  },
                ),
                const Expanded(child: UserList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
