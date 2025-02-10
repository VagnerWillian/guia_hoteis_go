import 'package:bloc/bloc.dart';

import '../../../core/_core.dart';
import '../../base_module/blocs/_blocs.dart';
import '../core/usecases/_usecases.dart';
import '_blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BaseBloc baseBloc;
  final GetMotelsUseCase _getMotelUseCase;

  HomeBloc(this.baseBloc, this._getMotelUseCase) : super(const HomeState.initial()) {
    on<UpdateFilterEvent>(_updateFilters);
    on<GetMotelsListEvent>(_getHotelsList);
    on<FailureEvent>(_defineFailure);
  }

  void _updateFilters(
    UpdateFilterEvent event,
    Emitter<HomeState> emit,
  ) {
    var updatedMap = Map<String, String>.from(state.filters);
    if (!state.filters.containsKey(event.key)) updatedMap[event.key] = event.value;
    if (state.filters.containsKey(event.key)) updatedMap.remove(event.key);
    emit(state.copyWith(filters: updatedMap));
  }

  Future<void> _getHotelsList(
    GetMotelsListEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      var motelPagination = await _getMotelUseCase(
        query: state.filters,
        location: baseBloc.state.selectedLocation!.location,
      );
      emit(state.copyWith(loading: false, motels: motelPagination.motels));
    } on Failure catch (failure) {
      emit(state.copyWith(failure: failure, loading: false));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _defineFailure(
    FailureEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(failure: event.failure, loading: false));
  }
}
