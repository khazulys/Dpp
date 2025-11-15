import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class CurrencyFormatter {
  static String format(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '${AppConstants.currency} ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
  
  static String formatCompact(double amount) {
    if (amount >= 1000000) {
      return '${AppConstants.currency} ${(amount / 1000000).toStringAsFixed(1)}jt';
    } else if (amount >= 1000) {
      return '${AppConstants.currency} ${(amount / 1000).toStringAsFixed(0)}rb';
    }
    return format(amount);
  }
}
