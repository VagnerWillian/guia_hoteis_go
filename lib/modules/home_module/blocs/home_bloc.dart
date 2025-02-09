import 'package:bloc/bloc.dart';

import '_blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<UpdateFilterEvent>(_updateFilters);
    on<GetMotelsListEvent>(_getHotelsList);
  }

  void _updateFilters(
    UpdateFilterEvent event,
    Emitter<HomeState> emit,
  ) {
    var updatedMap = Map<String, dynamic>.from(state.filters);
    if (!state.filters.containsKey(event.key)) updatedMap[event.key] = event.value;
    if (state.filters.containsKey(event.key)) updatedMap.remove(event.key);
    emit(state.copyWith(filters: updatedMap));
  }

  Future<void> _getHotelsList(
    GetMotelsListEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(loading: false));
  }
}
