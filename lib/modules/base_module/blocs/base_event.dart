import '../../../core/_core.dart';
import '../../../core/failures/failure.dart';

abstract class BaseEvent {}

class InitializeEvent extends BaseEvent {}

class ChangeSwitchMyLocationEvent extends BaseEvent {
  final bool value;

  ChangeSwitchMyLocationEvent({required this.value});
}

class ChangeLocationEvent extends BaseEvent {
  final LocationEntity location;

  ChangeLocationEvent({required this.location});
}

class LoadingLocationEvent extends BaseEvent {
  final bool value;

  LoadingLocationEvent({required this.value});
}

class FailureLocationEvent extends BaseEvent {
  final Failure? failure;

  FailureLocationEvent({required this.failure});
}
