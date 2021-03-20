import 'package:intl/intl.dart';

final dateFormat = DateFormat("MMMd");
final fullYearFormat = DateFormat("yMMMMd");
const String formattedDate = 'formattedDate';
const String unformattedDate = 'unformattedDate';

final dayFormat = DateFormat('E');
final DateTime today = DateTime.now();
String todayWithoutTime = today.toString().split(" ")[0];
DateTime getDay(int day, bool isAdd) {
  return isAdd
      ? today.add(new Duration(days: day))
      : today.subtract(new Duration(days: day));
}

final List<Map> day = [
  {
    formattedDate: dayFormat.format(getDay(3, false)),
    unformattedDate: getDay(3, false)
  },
  {
    formattedDate: dayFormat.format(getDay(2, false)),
    unformattedDate: getDay(2, false)
  },
  {
    formattedDate: dayFormat.format(getDay(1, false)),
    unformattedDate: getDay(1, false)
  },
  {formattedDate: 'Today', unformattedDate: today},
  {
    formattedDate: dayFormat.format(getDay(1, true)),
    unformattedDate: getDay(1, true)
  },
  {
    formattedDate: dayFormat.format(getDay(2, true)),
    unformattedDate: getDay(2, true)
  },
  {
    formattedDate: dayFormat.format(getDay(3, true)),
    unformattedDate: getDay(3, true)
  },
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
