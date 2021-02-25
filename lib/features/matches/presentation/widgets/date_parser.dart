import 'package:intl/intl.dart';

final dateFormat = DateFormat("MMMd");
final fullYearFormat = DateFormat("yMMMMd");

final dayFormat = DateFormat('E');

DateTime getDay(int day, bool isAdd) {
  final DateTime today = DateTime.now();
  return isAdd
      ? today.add(new Duration(days: day))
      : today.subtract(new Duration(days: day));
}

final List<String> day = [
  dayFormat.format(getDay(3, false)),
  dayFormat.format(getDay(2, false)),
  dayFormat.format(getDay(1, false)),
  'Today',
  dayFormat.format(getDay(1, true)),
  dayFormat.format(getDay(2, true)),
  dayFormat.format(getDay(3, true)),
];

final List<String> dayh = [
  'Live',
  dateFormat.format(getDay(3, false)),
  dateFormat.format(getDay(2, false)),
  dateFormat.format(getDay(1, false)),
  dateFormat.format(getDay(0, false)),
  dateFormat.format(getDay(1, true)),
  dateFormat.format(getDay(2, true)),
  dateFormat.format(getDay(3, true)),
  'Date'
];
