import '../../../core/core/entities/_entities.dart';

class SuiteItem implements SuiteItemEntity {
  @override
  late final String name;

  SuiteItem({required this.name});

  factory SuiteItem.fromJson(Map<String, dynamic> json) {
    return SuiteItem(name: json['nome']);
  }
}
