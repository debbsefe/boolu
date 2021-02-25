import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/presentation/cubits/calendar/cubit/calendar_cubit.dart';
import 'package:Boolu/features/matches/presentation/widgets/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'calendar/calender_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: SingleChildScrollView(
            child: Column(
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
                Height(3.0.h),
                BuildLeagueBody()
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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 1, child: Image.asset('assets/images/live_icon.png')),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: day.map((e) {
                  return Text(e,
                      style: CustomTheme.navbarText1.copyWith(
                        fontSize: width * font12,
                      ));
                }).toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    DateTime value = context.read<CalendarCubit>().state.value;
                    context.read<CalendarCubit>().showCalendar(value);
                  },
                  child: Image.asset('assets/images/calendar_icon.png')),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: dayh.map((e) {
            return Text(e,
                style: CustomTheme.navbarText1.copyWith(
                  color: e == 'Live' ? CustomTheme.lightGreen : Colors.white,
                  fontSize: width * font8,
                ));
          }).toList(),
        ),
      ],
    );
  }
}

class BuildLeague extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: CustomTheme.grey3)),
      child: Row(
        children: [
          Expanded(
              flex: 1, child: Image.asset('assets/images/calendar_icon.png')),
          Expanded(
            flex: 5,
            child: Text('English Premier League'.toUpperCase(),
                style: CustomTheme.navbarText1.copyWith(
                  fontSize: width * font12,
                )),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text('Feb 4',
                    style: CustomTheme.navbarText1.copyWith(
                      fontSize: width * font12,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_right,
                        color: CustomTheme.grey3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildLeagueBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      decoration: BoxDecoration(border: Border.all(color: CustomTheme.grey3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image.asset('assets/images/calendar_icon.png'),
                Height(1.5.h),
                Text('Arsenal',
                    style: CustomTheme.bodyText.copyWith(
                      fontSize: width * font12,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text('3:1',
                    style: CustomTheme.scoreText.copyWith(
                      fontSize: width * font18,
                    )),
                Height(1.5.h),
                Text('9PM WAT',
                    style: CustomTheme.bodyText2.copyWith(
                      fontSize: width * font10,
                    )),
                Height(1.5.h),
                Text('Emirates Stadium',
                    style: CustomTheme.bodyTextBold.copyWith(
                      fontSize: width * font10,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image.asset('assets/images/calendar_icon.png'),
                Height(1.5.h),
                Text('Spurs',
                    style: CustomTheme.bodyText.copyWith(
                      fontSize: width * font12,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
