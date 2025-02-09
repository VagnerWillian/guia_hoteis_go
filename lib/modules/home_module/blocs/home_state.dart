import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final Map<String, dynamic> filters;
  final bool loading;

  const HomeState({required this.filters, required this.loading});

  const HomeState.initial()
      : filters = const {},
        loading = false;

  HomeState copyWith({Map<String, dynamic>? filters, bool? loading}) {
    return HomeState(
      filters: filters ?? this.filters,
      loading: loading ?? this.loading,
    );
  }

  @override
  List get props => [filters, loading];
}
