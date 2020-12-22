part of 'select_bloc.dart';

abstract class SelectState {
  const SelectState();
}

class NotSelectState extends SelectState {
  @override
  List<Object> get props => [];
}

class SelectedState extends SelectState {
  final data;

  final int secondData;

  SelectedState({this.data, this.secondData});
  @override
  List<Object> get props => [];
}
