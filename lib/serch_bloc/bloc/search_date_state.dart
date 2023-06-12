part of 'search_date_bloc.dart';

abstract class SearchDateState extends Equatable {
  const SearchDateState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchDateState {}

class SearchLoading extends SearchDateState {}

class SearchLoaded extends SearchDateState {
  final List<Post> results;

  const SearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}

class SearchError extends SearchDateState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
class SearchNoDateState extends SearchDateState {
  final String message;

  const SearchNoDateState(this.message);

  @override
  List<Object> get props => [message];
}