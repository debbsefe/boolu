import 'package:intl/intl.dart';

final dateFormat = DateFormat("MMMd");
final fullYearFormat = DateFormat("yMMMMd");
const String formattedDate = 'formattedDate';
const String unformattedDate = 'unformattedDate';
const String formattedDay = 'formattedDay';

final dayFormat = DateFormat('E');
final DateTime today = DateTime.now();
String todayWithoutTime = today.toString().split(" ")[0];
DateTime getDay(int day, bool isAdd) {
  return isAdd
      ? today.add(new Duration(days: day))
      : today.subtract(new Duration(days: day));
}

final List<Map<String, Object>> dayh = [
  {
    formattedDate: dateFormat.format(getDay(3, false)),
    unformattedDate: getDay(3, false),
    formattedDay: dayFormat.format(getDay(3, false)),
  },
  {
    formattedDate: dateFormat.format(getDay(2, false)),
    unformattedDate: getDay(2, false),
    formattedDay: dayFormat.format(getDay(2, false)),
  },
  {
    formattedDate: dateFormat.format(getDay(1, false)),
    unformattedDate: getDay(1, false),
    formattedDay: dayFormat.format(getDay(1, false)),
  },
  {
    formattedDate: dateFormat.format(getDay(0, false)),
    unformattedDate: today,
    formattedDay: 'Today',
  },
  {
    formattedDate: dateFormat.format(getDay(1, true)),
    unformattedDate: getDay(1, true),
    formattedDay: dayFormat.format(getDay(1, true)),
  },
  {
    formattedDate: dateFormat.format(getDay(2, true)),
    unformattedDate: getDay(2, true),
    formattedDay: dayFormat.format(getDay(2, true)),
  },
  {
    formattedDate: dateFormat.format(getDay(3, true)),
    unformattedDate: getDay(3, true),
    formattedDay: dayFormat.format(getDay(3, true)),
  },
];
