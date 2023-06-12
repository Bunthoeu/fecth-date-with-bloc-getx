import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/login_screen/login_screen.dart';
import 'package:flutter_rest_api/post_view.dart';
import 'package:flutter_rest_api/serch_bloc/bloc/search_date_bloc.dart';
import 'package:flutter_rest_api/serch_bloc/search.dart';
import 'package:flutter_rest_api/serch_bloc/servic.dart';
import 'package:flutter_rest_api/view_getx.dart';
import 'package:http/http.dart';

void main() {
  final searchReposi = SearchRepository();
  final searchBloc = SearchDateBloc(searchReposi);

  runApp(MyApp(searchBloc: searchBloc,));
}

class MyApp extends StatelessWidget {
  final SearchDateBloc searchBloc;

  const MyApp({super.key, required this.searchBloc});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: searchBloc),
      ],
      child: MaterialApp(
        home: SearchPage(),
      ),
    );
  }
}
