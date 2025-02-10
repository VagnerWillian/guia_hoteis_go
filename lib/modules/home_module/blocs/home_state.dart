import 'package:equatable/equatable.dart';

import '../../../core/_core.dart';

class HomeState extends Equatable {
  final Map<String, String> filters;
  final bool loading;
  final List<MotelEntity> motels;
  final Failure? failure;

  const HomeState({
    required this.filters,
    required this.loading,
    required this.motels,
    required this.failure,
  });

  const HomeState.initial()
      : filters = const {},
        loading = false,
        motels = const [],
        failure = null;

  HomeState copyWith({
    Map<String, String>? filters,
    bool? loading,
    List<MotelEntity>? motels,
    Failure? failure,
  }) {
    return HomeState(
      filters: filters ?? this.filters,
      loading: loading ?? this.loading,
      motels: motels ?? this.motels,
      failure: failure ?? this.failure,
    );
  }

  @override
  List get props => [filters, loading, motels, failure];
}
