part of 'filter_bloc.dart';

abstract class FilterEvent {
  const FilterEvent();
}

class GetTicketByStatusEvent extends FilterEvent {
  final String status;
  GetTicketByStatusEvent({this.status});
}
