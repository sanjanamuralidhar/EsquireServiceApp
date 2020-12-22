import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleOffState());

  @override
  Stream<ToggleState> mapEventToState(
    ToggleEvent event,
  ) async* {
    print(event.toString());
    if (event is ToggleOffEvent) yield ToggleOffState();
    if (event is ToggleOnEvent) yield ToggleOnState();
  }
}
