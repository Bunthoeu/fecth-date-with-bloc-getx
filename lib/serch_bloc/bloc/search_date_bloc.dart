import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rest_api/post_model.dart';

import '../servic.dart';

part 'search_date_event.dart';
part 'search_date_state.dart';

class SearchDateBloc extends Bloc<SearchDateEvent, SearchDateState> {
  final SearchRepository searchRepository;

  SearchDateBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchDateEvent>((event, emit) async {
      if (event is SearchTextChanged) {
        emit(SearchLoading());
        try {
          final results = await searchRepository.search(event.query);
          emit(SearchLoaded(results));
          
        } catch (e) {
          emit(SearchError(e.toString()));
        }
      }
    });
  }

//   async {
// if (event is SearchTextChanged) {
//       yield SearchLoading();
//       try {
//         final results = await searchRepository.search(event.query);
//         yield SearchLoaded(results);
//       } catch (e) {
//         yield SearchError(e.toString());
//       }
//     }
//   }
}
