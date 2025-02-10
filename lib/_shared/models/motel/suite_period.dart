import '../../../core/core/entities/_entities.dart';
import '../_models.dart';

class SuitePeriod implements SuitePeriodEntity {
  @override
  late final bool hasCourtesy;

  @override
  late final double price;

  @override
  late final double priceTotal;

  @override
  late final String time;

  @override
  late final String timeFormated;

  @override
  late final SuiteDiscountEntity? discount;

  SuitePeriod({
    required this.time,
    required this.timeFormated,
    required this.hasCourtesy,
    required this.price,
    required this.priceTotal,
    required this.discount,
  });

  factory SuitePeriod.fromJson(Map<String, dynamic> json) {
    return SuitePeriod(
      time: json['tempo'],
      timeFormated: json['tempoFormatado'],
      hasCourtesy: json['temCortesia'],
      price: json['valor'],
      priceTotal: json['valorTotal'],
      discount: json['desconto']==null ? null : SuiteDiscount.fromJson(json['desconto']),
    );
  }
}
