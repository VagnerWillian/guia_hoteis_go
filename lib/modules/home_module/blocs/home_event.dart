abstract class HomeEvent {}

class UpdateFilterEvent extends HomeEvent {
  String key;
  dynamic value;
  UpdateFilterEvent({required this.key, required this.value});
}

class GetMotelsListEvent extends HomeEvent{
  GetMotelsListEvent();
}