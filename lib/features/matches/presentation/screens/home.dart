import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/presentation/bloc/matches/bloc/matches_bloc.dart';
import 'package:Boolu/features/matches/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:Boolu/features/matches/presentation/cubits/navbarTextColor/navbar_text_color_cubit.dart';
import 'package:Boolu/features/matches/presentation/widgets/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'calendar/calender_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'league/build_league.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<CalendarCubit, CalendarState>(
                  builder: (context, state) {
                    if (state.status == Status.showCalendar) {
                      return CalendarWidget();
                    }
                    if (state.status == Status.showSelectedDate) {
                      return BuildSelectedDateWidget();
                    }
                    return BuildNavBar();
                  },
                ),
                Height(3.0.h),
                BuildLeague(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildSelectedDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
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

        // month and year
        Text(
          fullYearFormat.format(context.watch<CalendarCubit>().state.value),
          style: TextStyle(
              color: CustomTheme.accent1,
              fontSize: 10,
              fontWeight: FontWeight.w700),
        ),

        //calender close button
        GestureDetector(
            onTap: () {
              DateTime value = context.read<CalendarCubit>().state.value;
              context.read<CalendarCubit>().showCalendar(value);
            },
            child: Image.asset('assets/images/calendar_down.png',
                scale: 5, color: CustomTheme.accent1)),
      ],
    );
  }
}

class BuildNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              context.read<NavbarTextColorCubit>().setIndex(null);

              final matchBloc =
                  BlocProvider.of<MatchesBloc>(context, listen: false);

              matchBloc.add(GetMatches(
                  dateFrom: todayWithoutTime, dateTo: todayWithoutTime));
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/images/live_icon.png',
                  scale: 2.5,
                  color:
                      context.watch<NavbarTextColorCubit>().state.index == null
                          ? null
                          : Colors.green,
                ),
                Height(4.0),
                Text('Live',
                    style: CustomTheme.navbarText2.copyWith(
                      fontSize: width * font8,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: dayh.asMap().entries.map((entry) {
              var e = entry.value;
              return GestureDetector(
                onTap: () {
                  context.read<NavbarTextColorCubit>().setIndex(entry.key);

                  print('unformattedDate ${e[unformattedDate]}');
                  final String date =
                      e[unformattedDate].toString().split(" ")[0];
                  final weatherBloc =
                      BlocProvider.of<MatchesBloc>(context, listen: false);

                  weatherBloc.add(GetMatches(dateFrom: date, dateTo: date));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e[formattedDay],
                        style:
                            context.watch<NavbarTextColorCubit>().state.index ==
                                    entry.key
                                ? CustomTheme.navbarText11.copyWith(
                                    fontSize: width * font12,
                                  )
                                : CustomTheme.navbarText1.copyWith(
                                    fontSize: width * font12,
                                  )),
                    Height(8.0),
                    Text(e[formattedDate],
                        style:
                            context.watch<NavbarTextColorCubit>().state.index ==
                                    entry.key
                                ? CustomTheme.navbarText21.copyWith(
                                    fontSize: width * font12,
                                  )
                                : CustomTheme.navbarText2.copyWith(
                                    fontSize: width * font8,
                                  )),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () {
                DateTime value = context.read<CalendarCubit>().state.value;
                context.read<CalendarCubit>().showCalendar(value);
              },
              child: Column(
                children: [
                  Text('Date',
                      style: CustomTheme.navbarText1.copyWith(
                        fontSize: width * font12,
                      )),
                  Height(4.0),
                  Image.asset('assets/images/calendar_icon.png', scale: 3.5),
                ],
              )),
        ),
      ],
    );
  }
}
