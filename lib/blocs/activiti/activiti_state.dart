part of 'activiti_bloc.dart';

abstract class ActivitiState extends Equatable {
  const ActivitiState();

  @override
  List<Object> get props => [];
}

class ActivitiInitial extends ActivitiState {}

class FormDataLoadedState extends ActivitiState {}

class TaskCompletedState extends ActivitiState {}
