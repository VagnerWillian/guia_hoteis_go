import '../_entities.dart';

abstract class SuitePeriodEntity {
  late String timeFormated;
  late String time;
  late double price;
  late double priceTotal;
  late bool hasCourtesy;
  late SuiteDiscountEntity? discount;
}
