part of 'activiti_bloc.dart';

abstract class ActivitiEvent extends Equatable {
  const ActivitiEvent();

  @override
  List<Object> get props => [];
}

class GetAllTaskEvent extends ActivitiEvent {
  final Ticket ticket;
  GetAllTaskEvent({this.ticket});
}

class CompleteTaskEvent extends ActivitiEvent {
  final Map data;
  CompleteTaskEvent({this.data});
}
