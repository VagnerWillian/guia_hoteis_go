import '../../../_core.dart';

abstract class MotelPaginationEntity{
  late int page;
  late double maxPage;
  late int quantityPerPage;
  late int totalSuites;
  late int totalMotels;
  late int radius;
  late List<MotelEntity> motels;
}