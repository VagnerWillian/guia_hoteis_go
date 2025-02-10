import 'package:bloc/bloc.dart';

import '../core/domain/usecases/get_motel_usecase.dart';
import '_blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMotelsUseCase _getMotelUseCase;

  HomeBloc(this._getMotelUseCase) : super(const HomeState.initial()) {
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
    var motelPagination = await _getMotelUseCase(query: state.filters);
    emit(state.copyWith(loading: false, motels: motelPagination.motels));
  }
}
