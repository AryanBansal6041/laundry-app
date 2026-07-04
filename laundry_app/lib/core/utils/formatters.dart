import 'package:intl/intl.dart';

abstract final class Formatters {
  static final _currencyFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  static final _weightFormat = NumberFormat('#,##0.0#', 'en_IN');

  static final _dateFormat = DateFormat('MMM d, yyyy');
  static final _dateTimeFormat = DateFormat('MMM d, yyyy · h:mm a');
  static final _timeFormat = DateFormat('h:mm a');
  static final _isoDateFormat = DateFormat('yyyy-MM-dd');

  static String currency(num amount) => _currencyFormat.format(amount);

  static String weight(num kg) => '${_weightFormat.format(kg)} kg';

  static String date(DateTime dt) => _dateFormat.format(dt.toLocal());

  static String dateTime(DateTime dt) => _dateTimeFormat.format(dt.toLocal());

  static String time(DateTime dt) => _timeFormat.format(dt.toLocal());

  static String isoDate(DateTime dt) => _isoDateFormat.format(dt);

  static String quantity(int qty) =>
      NumberFormat('#,##0', 'en_IN').format(qty);

  static String pieces(int count) =>
      '$count ${count == 1 ? 'piece' : 'pieces'}';

  static String durationSince(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'just now';
  }

  static String editCountdown(DateTime entryTimestamp) {
    final deadline = entryTimestamp.add(const Duration(hours: 24));
    final remaining = deadline.difference(DateTime.now());
    if (remaining.isNegative) return 'Edit window expired';
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes % 60;
    return 'Editable for ${hours}h ${minutes}m';
  }
}
