import 'dart:async';

import 'package:EsquireCallCenterExecutiveApp/mocks/message.dart';
import 'package:EsquireCallCenterExecutiveApp/mocks/repo.dart';
import 'package:bloc/bloc.dart';

part 'chatroom_event.dart';
part 'chatroom_state.dart';

class ChatroomBloc extends Bloc<ChatroomEvent, ChatroomState> {
  List<Message> messages = [];
  ChatroomBloc() : super(MessageUpdateState(messages: Repo.getAllMessages)) {
    Repo.getAllMessages.forEach((element) {
      messages.add(element);
    });
  }

  @override
  Stream<ChatroomState> mapEventToState(
    ChatroomEvent event,
  ) async* {
    if (event is MessageUpdateEvent) {
      messages.add(event.message);
      yield MessageUpdateState(messages: messages);
    }
  }
}
