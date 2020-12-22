part of 'filter_bloc.dart';

abstract class FilterState {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {}

class FilteredState extends FilterState {
  final List<Ticket> tickets;
  FilteredState({this.tickets});
}
