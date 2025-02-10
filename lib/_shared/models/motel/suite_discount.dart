import '../../../core/_core.dart';

class SuiteDiscount implements SuiteDiscountEntity {
  @override
  late final double discount;

  SuiteDiscount({required this.discount});

  factory SuiteDiscount.fromJson(Map<String, dynamic> json) {
    return SuiteDiscount(discount: json['desconto']);
  }
}
