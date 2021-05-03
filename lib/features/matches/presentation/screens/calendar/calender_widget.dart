import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/presentation/bloc/matches/matches_bloc.dart';
import 'package:Boolu/features/matches/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:Boolu/features/matches/presentation/widgets/date_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar.dart';
import 'package:flutter/material.dart';

enum CalendarViews { dates, months, year }

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDateTime;
  DateTime _selectedDateTime;
  List<Calendar> _sequentialDates;
  int midYear;
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN'
  ];
  final List<String> _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();

    ///read value of selectedTime once
    DateTime selectedTime = context.read<CalendarCubit>().state.value;

    ///if selectedtime is null, use currenttime
    _currentDateTime = selectedTime != null
        ? DateTime(selectedTime.year, selectedTime.month)
        : DateTime(date.year, date.month);
    _selectedDateTime = selectedTime != null
        ? DateTime(selectedTime.year, selectedTime.month, selectedTime.day)
        : DateTime(date.year, date.month, date.day);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendar());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('_selectedDateTime $_selectedDateTime');
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: CustomTheme.scaffoldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: (_currentView == CalendarViews.dates)
            ? _datesView()
            : (_currentView == CalendarViews.months)
                ? _showMonthsList()
                : _yearsView(midYear ?? _currentDateTime.year));
  }

  // dates view
  Widget _datesView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.read<CalendarCubit>().hideCalendar();
                final matchBloc =
                    BlocProvider.of<MatchesBloc>(context, listen: false);
                matchBloc.add(GetMatches(
                    dateFrom: todayWithoutTime, dateTo: todayWithoutTime));
              },
              child: Column(
                children: [
                  Text('Today',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 10,
                      )),
                  Height(5),
                  Text('${dateFormat.format(getDay(0, false))}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 8,
                      )),
                ],
              ),
            ),
            // prev month button
            _toggleBtn(false),
            // month and year
            InkWell(
              onTap: () => setState(() => _currentView = CalendarViews.months),
              child: Center(
                child: Text(
                  '${_monthNames[_currentDateTime.month - 1]} ${_currentDateTime.year}',
                  style: TextStyle(
                      color: CustomTheme.accent1,
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            // next month button
            _toggleBtn(true),

            //calender close button
            GestureDetector(
                onTap: () {
                  context.read<CalendarCubit>().selectDate(_selectedDateTime);
                },
                child: Image.asset('assets/images/calendar_accent.png',
                    scale: 4, color: CustomTheme.accent1)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white.withOpacity(0.65),
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(child: _calendarBody()),
      ],
    );
  }

  // next / prev month buttons
  Widget _toggleBtn(bool next) {
    return InkWell(
      onTap: () {
        if (_currentView == CalendarViews.dates) {
          setState(() => (next) ? _getNextMonth() : _getPrevMonth());
        } else if (_currentView == CalendarViews.year) {
          if (next) {
            midYear =
                (midYear == null) ? _currentDateTime.year + 9 : midYear + 9;
          } else {
            midYear =
                (midYear == null) ? _currentDateTime.year - 9 : midYear - 9;
          }
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          (next) ? Icons.arrow_forward : Icons.arrow_back,
          size: 12,
          color: CustomTheme.scaffoldColor,
        ),
      ),
    );
  }

  // calendar
  Widget _calendarBody() {
    if (_sequentialDates == null) return Container();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: _sequentialDates.length + 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisCount: 7,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        if (index < 7) return _weekDayTitle(index);
        if (_sequentialDates[index - 7].date == _selectedDateTime)
          return _selector(_sequentialDates[index - 7]);
        return _calendarDates(_sequentialDates[index - 7]);
      },
    );
  }

  // calendar header
  Widget _weekDayTitle(int index) {
    return Text(
      _weekDays[index],
      style: TextStyle(color: Colors.white, fontSize: 9),
    );
  }

  // calendar element
  Widget _calendarDates(Calendar calendarDate) {
    return InkWell(
      onTap: () {
        if (_selectedDateTime != calendarDate.date) {
          if (calendarDate.nextMonth) {
            _getNextMonth();
          } else if (calendarDate.prevMonth) {
            _getPrevMonth();
          }

          setState(() {
            _selectedDateTime = calendarDate.date;

            ///save selectedDateTime to calendarcubit
            context.read<CalendarCubit>().showCalendar(_selectedDateTime);

            ///format the selectedDateTime and call weatherbloc to update the matches
            final String date = _selectedDateTime.toString().split(" ")[0];
            final matchBloc =
                BlocProvider.of<MatchesBloc>(context, listen: false);
            matchBloc.add(GetMatches(dateFrom: date, dateTo: date));
          });
        }
      },
      child: Center(
          child: Text(
        '${calendarDate.date.day}',
        style: TextStyle(
          fontSize: 10,
          color: (calendarDate.thisMonth)
              ? CustomTheme.white
              : Colors.white.withOpacity(0.5),
        ),
      )),
    );
  }

  // date selector
  Widget _selector(Calendar calendarDate) {
    return Container(
      // width: 20,
      // height: 20,
      decoration: BoxDecoration(
        color: CustomTheme.accent1,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          '${calendarDate.date.day}',
          style: TextStyle(
              color: CustomTheme.scaffoldColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  // get next month calendar
  void _getNextMonth() {
    if (_currentDateTime.month == 12) {
      _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month + 1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth() {
    if (_currentDateTime.month == 1) {
      _currentDateTime = DateTime(_currentDateTime.year - 1, 12);
    } else {
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month - 1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar() {
    _sequentialDates = CustomCalendar().getMonthCalendar(
        _currentDateTime.month, _currentDateTime.year,
        startWeekDay: StartWeekDay.monday);
  }

  // show months list
  Widget _showMonthsList() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => setState(() => _currentView = CalendarViews.year),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${_currentDateTime.year}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _monthNames.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                _currentDateTime = DateTime(_currentDateTime.year, index + 1);
                _getCalendar();
                setState(() => _currentView = CalendarViews.dates);
              },
              title: Center(
                child: Text(
                  _monthNames[index],
                  style: TextStyle(
                      fontSize: 18,
                      color: (index == _currentDateTime.month - 1)
                          ? Colors.yellow
                          : Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // years list views
  Widget _yearsView(int midYear) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _toggleBtn(false),
            Spacer(),
            _toggleBtn(true),
          ],
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                int thisYear;
                if (index < 4) {
                  thisYear = midYear - (4 - index);
                } else if (index > 4) {
                  thisYear = midYear + (index - 4);
                } else {
                  thisYear = midYear;
                }
                return ListTile(
                  onTap: () {
                    _currentDateTime =
                        DateTime(thisYear, _currentDateTime.month);
                    _getCalendar();
                    setState(() => _currentView = CalendarViews.months);
                  },
                  title: Text(
                    '$thisYear',
                    style: TextStyle(
                        fontSize: 18,
                        color: (thisYear == _currentDateTime.year)
                            ? Colors.yellow
                            : Colors.white),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
