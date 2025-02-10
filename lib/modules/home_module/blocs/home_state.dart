import 'package:equatable/equatable.dart';

import '../../../core/_core.dart';

class HomeState extends Equatable {
  final Map<String, dynamic> filters;
  final bool loading;
  final List<MotelEntity> motels;

  const HomeState({
    required this.filters,
    required this.loading,
    required this.motels,
  });

  const HomeState.initial()
      : filters = const {},
        loading = false,
        motels = const [];

  HomeState copyWith({
    Map<String, dynamic>? filters,
    bool? loading,
    List<MotelEntity>? motels,
  }) {
    return HomeState(
      filters: filters ?? this.filters,
      loading: loading ?? this.loading,
      motels: motels ?? this.motels,
    );
  }

  @override
  List get props => [filters, loading, motels];
}
