import '../_entities.dart';

abstract class MotelEntity {
  late String fantasy;
  late String logo;
  late String district;
  late double distance;
  late int favoriteQuantity;
  late int reviewsQuantity;
  late double reviewsAverage;
  late List<SuiteMotelEntity> suites;
}
