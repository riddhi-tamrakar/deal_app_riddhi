import 'package:intl/intl.dart';


String formatDate(String dateStr) {
  try {
    final dateTime = DateTime.parse(dateStr);
    return DateFormat('d MMM yyyy').format(dateTime);
  } catch (_) {
    return dateStr;
  }
}
