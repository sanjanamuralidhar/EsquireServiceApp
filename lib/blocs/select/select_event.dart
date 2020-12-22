part of 'select_bloc.dart';

abstract class SelectEvent {
  const SelectEvent();
}

class NotSelectEvent extends SelectEvent {
  @override
  List<Object> get props => [];
}

class SelectedEvent extends SelectEvent {
  final data;
  final int secondData;

  SelectedEvent({this.data, this.secondData});
  @override
  List<Object> get props => [];
}
