import '../../../core/_core.dart';
import '../../_shared.dart';

class Motel implements MotelEntity {
  @override
  late final String fantasy;

  @override
  late final String logo;

  @override
  late final String district;

  @override
  late final double distance;

  @override
  late final int favoriteQuantity;

  @override
  late final double reviewsAverage;

  @override
  late final int reviewsQuantity;

  @override
  late final List<SuiteMotelEntity> suites;

  Motel({
    required this.fantasy,
    required this.logo,
    required this.district,
    required this.distance,
    required this.favoriteQuantity,
    required this.reviewsAverage,
    required this.reviewsQuantity,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasy: json['fantasia'],
      logo: json['logo'],
      district: json['bairro'],
      distance: json['distancia'],
      favoriteQuantity: json['qtdFavoritos'],
      reviewsAverage: json['media'],
      reviewsQuantity: json['qtdAvaliacoes'],
      suites: (json['suites'] as List).map((e) => SuiteMotel.fromJson(e)).toList(),
    );
  }
}
