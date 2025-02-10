import 'package:intl/intl.dart';

extension StringExtension on double {
  String get getFormatToRealBr => NumberFormat.simpleCurrency(locale: 'pt_BR').format(this);
}
