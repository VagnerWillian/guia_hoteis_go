import '../../../core/_core.dart';
import '../../_shared.dart';

class MotelPagination implements MotelPaginationEntity {
  @override
  late final int page;

  @override
  late final double maxPage;

  @override
  late final int quantityPerPage;

  @override
  late final int radius;

  @override
  late final int totalMotels;

  @override
  late final int totalSuites;

  @override
  late final List<MotelEntity> motels;

  MotelPagination({
    required this.page,
    required this.maxPage,
    required this.quantityPerPage,
    required this.radius,
    required this.totalMotels,
    required this.totalSuites,
    required this.motels,
  });

  factory MotelPagination.fromJson(Map<String, dynamic> json) {
    return MotelPagination(
      page: json['pagina'],
      maxPage: json['maxPaginas'],
      quantityPerPage: json['qtdPorPagina'],
      radius: json['raio'],
      totalMotels: json['totalMoteis'],
      totalSuites: json['totalSuites'],
      motels: (json['moteis'] as List).map((e)=>Motel.fromJson(e)).toList(),
    );
  }
}
