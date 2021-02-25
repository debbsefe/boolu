import 'package:bloc/bloc.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState(status: Status.initial));

  void showCalendar(DateTime value) {
    emit(CalendarState(status: Status.showCalendar, value: value));
  }

  void hideCalendar() => emit(CalendarState(status: Status.initial));

  void selectDate(DateTime value) {
    emit(CalendarState(status: Status.showSelectedDate, value: value));

    print('value ${value}');
  }
}
