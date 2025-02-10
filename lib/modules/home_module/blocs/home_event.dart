import '../../../core/_core.dart';

abstract class HomeEvent {}

class UpdateFilterEvent extends HomeEvent {
  String key;
  String value;
  UpdateFilterEvent({required this.key, required this.value});
}

class GetMotelsListEvent extends HomeEvent{
  GetMotelsListEvent();
}

class FailureEvent extends HomeEvent{
  final Failure? failure;
  FailureEvent(this.failure);
}