import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildNavBar(),
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

class BuildNavBar extends StatelessWidget {
  final dateFormat = DateFormat("MMMd");
  final dayFormat = DateFormat('E');

  DateTime getDay(int day, bool isAdd) {
    final DateTime today = DateTime.now();
    return isAdd
        ? today.add(new Duration(days: day))
        : today.subtract(new Duration(days: day));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;

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
                flex: 1, child: Image.asset('assets/images/calendar_icon.png')),
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
