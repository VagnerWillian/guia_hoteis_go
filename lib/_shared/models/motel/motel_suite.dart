import '../../../core/_core.dart';
import '../../_shared.dart';

class SuiteMotel implements SuiteMotelEntity {
  @override
  late final String name;

  @override
  late final List<String> pictures;

  @override
  late final List<SuiteItemCatEntity> itemsCategory;

  @override
  late final List<SuiteItemEntity> items;

  @override
  late final List<SuitePeriodEntity> periods;

  @override
  late final int quantity;

  @override
  late final bool showQuantityAvailable;

  SuiteMotel({
    required this.name,
    required this.itemsCategory,
    required this.items,
    required this.periods,
    required this.pictures,
    required this.quantity,
    required this.showQuantityAvailable,
  });

  factory SuiteMotel.fromJson(Map<String, dynamic> json) {
    return SuiteMotel(
      name: json['nome'],
      items: (json['itens'] as List).map((e) => SuiteItem.fromJson(e)).toList(),
      itemsCategory: (json['categoriaItens'] as List).map((e) => SuiteItemCat.fromJson(e)).toList(),
      periods: (json['periodos'] as List).map((e) => SuitePeriod.fromJson(e)).toList(),
      pictures: json['fotos'],
      quantity: json['qtd'],
      showQuantityAvailable: json['exibirQtdDisponiveis'],
    );
  }
}
