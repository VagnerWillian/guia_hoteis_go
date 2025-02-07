import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/failures/failure.dart';
import '../core/_core.dart';
import '_blocs.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final GetLocationsUseCase _getLocationsUseCase;

  BaseBloc(this._getLocationsUseCase) : super(const BaseState.initial()) {
    on<InitializeEvent>(_getAllLocations);
    on<ChangeSwitchMyLocationEvent>(_switchMyLocation);
    on<ChangeLocationEvent>(_changeLocation);
    on<FailureLocationEvent>(_showFailure);
  }

  Future<void> _getAllLocations(
    InitializeEvent event,
    Emitter<BaseState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      var locations = await _getLocationsUseCase();
      emit(state.copyWith(locations: locations));
    } on Failure catch (failure) {
      add(FailureLocationEvent(failure: failure));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void _switchMyLocation(
    ChangeSwitchMyLocationEvent event,
    Emitter<BaseState> emit,
  ) {
    emit(state.copyWith(activateMyLocation: event.value));
  }

  void _changeLocation(
    ChangeLocationEvent event,
    Emitter<BaseState> emit,
  ) {
    emit(state.copyWith(selectedLocation: event.location));
    Modular.to.pop();
  }

  void _showFailure(
    FailureLocationEvent event,
    Emitter<BaseState> emit,
  ) {
    emit(state.copyWith(failure: event.failure));
  }
}
