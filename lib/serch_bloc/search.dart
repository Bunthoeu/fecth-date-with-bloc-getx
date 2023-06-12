import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_date_bloc.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (query) {
              context.read<SearchDateBloc>().add(SearchTextChanged(query));
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),
        body: BlocBuilder<SearchDateBloc, SearchDateState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchLoaded) {
              if (state.results.isEmpty) {
                return Center(child: Text('No API'));
              } else
                return ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    final result = state.results[index];
                    return ListTile(
                      title: Text(result.title),
                      subtitle: Text(result.body),
                    );
                  },
                );
            } else if (state is SearchError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No Data'));
          },
        ));
  }
}
