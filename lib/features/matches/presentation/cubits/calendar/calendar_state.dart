part of 'calendar_cubit.dart';

enum Status { initial, showCalendar, showSelectedDate }

class CalendarState {
  final Status status;
  final DateTime value;

  CalendarState({this.value, this.status});
}
