import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigmathor/bloc/search/search_bloc.dart';
import 'package:sigmathor/bloc/selected_user/selected_user_bloc.dart';
import 'package:sigmathor/bloc/user_list/user_list_bloc.dart';
import 'package:sigmathor/screen/home/widget/user_item.dart';

import '../../../domain/user.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> data = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, searchState) {
          if (searchState is QueriedData) {
            return _buildList(searchState.data);
          }
          return BlocBuilder<UserListBloc, UserListState>(
            builder: (_, state) {
              if (state is LoadingUsers) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is LoadedUsers) {
                return _buildList(state.data);
              }

              if (state is FailureToLoad) {
                return _buildMessage(
                  "Servidor indisponível",
                  "assets/sad.svg",
                );
              }

              return _buildMessage(
                "Sem dados a serem exibidos",
                "assets/no_data.svg",
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMessage(String message, String imagePath) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 125, width: 125, child: SvgPicture.asset(imagePath)),
          Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList(List<User> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                BlocProvider.of<SelectedUserBloc>(context).add(
                  SelectUser(data[index]),
                );
              },
              child: UserItem(user: data[index]),
            ),
          );
        },
      ),
    );
  }
}
