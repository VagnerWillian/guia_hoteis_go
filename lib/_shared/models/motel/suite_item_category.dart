import '../../../core/core/entities/_entities.dart';

class SuiteItemCat implements SuiteItemCatEntity {
  @override
  late final String icon;

  @override
  late final String name;

  SuiteItemCat({
    required this.name,
    required this.icon,
  });

  factory SuiteItemCat.fromJson(Map<String, dynamic> json) {
    return SuiteItemCat(
      name: json['nome'],
      icon: json['icone'],
    );
  }
}
