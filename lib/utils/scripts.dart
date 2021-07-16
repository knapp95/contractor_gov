import 'package:intl/intl.dart';

String formatDate(DateTime? date, {format = 'yyyy-MM-dd'}) {
  final dateTmp = date ?? DateTime.now();
  return DateFormat(format).format(dateTmp);
}