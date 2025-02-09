import '../_entities.dart';

abstract class SuiteMotelEntity {
  late String name;
  late int quantity;
  late bool showQuantityAvailable;
  late List<String> pictures;
  late List<SuiteItemCatEntity> itemsCategory;
  late List<SuitePeriodEntity> periods;
  late List<SuiteItemEntity> items;
}
