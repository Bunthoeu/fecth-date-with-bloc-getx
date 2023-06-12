part of 'search_date_bloc.dart';

abstract class SearchDateEvent extends Equatable {
  const SearchDateEvent();

  @override
  List<Object> get props => [];
}
class SearchTextChanged extends SearchDateEvent {
  final String query;

  const SearchTextChanged(this.query);

  @override
  List<Object> get props => [query];
}