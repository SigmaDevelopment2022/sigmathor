import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigmathor/bloc/search/search_bloc.dart';

import '../../../domain/user.dart';
import '../../widget/CustomTextField.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<User> data;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextField(
        height: 50,
        width: MediaQuery.of(context).size.width,
        icon: Icons.search,
        label: "Pesquisar...",
        onValueChange: (value) {
          BlocProvider.of<SearchBloc>(context).add(QueryTerm(
            term: value,
            source: widget.data,
          ));
        },
      ),
    );
  }
}
