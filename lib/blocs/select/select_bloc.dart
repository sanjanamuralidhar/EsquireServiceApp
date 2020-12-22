import 'dart:async';

import 'package:bloc/bloc.dart';

part 'select_event.dart';
part 'select_state.dart';

class SelectBloc extends Bloc<SelectEvent, SelectState> {
  SelectBloc() : super(NotSelectState());
  @override
  Stream<SelectState> mapEventToState(
    SelectEvent event,
  ) async* {
    if (event is NotSelectEvent) yield NotSelectState();
    if (event is SelectedEvent)
      yield SelectedState(data: event.data, secondData: event.secondData);
  }
}
