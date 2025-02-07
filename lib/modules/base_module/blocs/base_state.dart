import 'package:equatable/equatable.dart';

import '../../../../core/_core.dart';
import '../../../core/failures/failure.dart';

class BaseState extends Equatable {
  final LocationEntity? selectedLocation;
  final bool activateMyLocation;
  final bool loading;
  final Map<String, List<LocationEntity>> locations;
  final Failure? failure;

  const BaseState({
    this.selectedLocation,
    this.activateMyLocation = false,
    this.loading = false,
    this.locations = const {},
    this.failure,
  });

  const BaseState.initial()
      : selectedLocation = null,
        activateMyLocation = false,
        loading = true,
        locations = const {},
        failure = null;

  BaseState copyWith({
    LocationEntity? selectedLocation,
    bool? activateMyLocation,
    bool? loading,
    Map<String, List<LocationEntity>>? locations,
    Failure? failure,
  }) {
    return BaseState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      activateMyLocation: activateMyLocation ?? this.activateMyLocation,
      loading: loading ?? this.loading,
      locations: locations ?? this.locations,
      failure: failure ?? this.failure,
    );
  }

  @override
  List get props => [
        selectedLocation,
        activateMyLocation,
        loading,
        locations,
        failure,
      ];
}
