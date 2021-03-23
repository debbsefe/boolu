import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/presentation/bloc/matches/bloc/matches_bloc.dart';
import 'package:Boolu/features/matches/presentation/cubits/calendar/cubit/calendar_cubit.dart';
import 'package:Boolu/features/matches/presentation/screens/match/match_details.dart';
import 'package:Boolu/features/matches/presentation/widgets/date_parser.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildLeague extends StatefulWidget {
  @override
  _BuildLeagueState createState() => _BuildLeagueState();
}

class _BuildLeagueState extends State<BuildLeague> {
  bool isVisible = false;

  int index;
  @override
  void initState() {
    super.initState();
    final matchBloc = BlocProvider.of<MatchesBloc>(context, listen: false);

    matchBloc
        .add(GetMatches(dateFrom: todayWithoutTime, dateTo: todayWithoutTime));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return BlocBuilder<MatchesBloc, MatchesState>(builder: (context, state) {
      if (state is MatchesLoading) {
        return CircularProgressIndicator();
      } else if (state is MatchesError) {
        return Text(state.message,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * font12,
            ));
      } else if (state is MatchesLoaded) {
        final matches = state.matchesModel;
        DateTime selectedTime = context.watch<CalendarCubit>().state.value;
        String _currentDate = selectedTime == null
            ? dateFormat.format(today)
            : dateFormat.format(selectedTime);
        return Column(
          children: [
            matches.isEmpty
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: CustomTheme.grey3)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.network(matches[0].competitionLogo,
                                height: 25)),
                        Expanded(
                          flex: 5,
                          child: Text(
                              matches[0].competitionName.toUpperCase() ?? '',
                              style: CustomTheme.navbarText1.copyWith(
                                fontSize: width * font12,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(_currentDate,
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
                  ),
            Height(3.0.h),
            Column(
              children: matches.asMap().entries.map((entry) {
                // print('goalScorers ${e.lineups}');
                var e = entry.value;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (index == entry.key || index == null) {
                          setState(() {
                            isVisible = !isVisible;
                            index = entry.key;
                          });
                        } else {
                          setState(() {
                            index = entry.key;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
                        margin: EdgeInsets.symmetric(vertical: 1.0.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.grey3)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Image.network(e.homeLogo, height: 40),
                                  Height(1.5.h),
                                  Text(e.home,
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
                                  Text(
                                      e.homescore.toString() +
                                          ':' +
                                          e.awayscore.toString(),
                                      style: CustomTheme.scoreText.copyWith(
                                        fontSize: width * font18,
                                      )),
                                  Height(1.5.h),
                                  Text(e.matchTime,
                                      style: CustomTheme.bodyText2.copyWith(
                                        fontSize: width * font10,
                                      )),
                                  Height(1.5.h),
                                  Text(e.venue,
                                      textAlign: TextAlign.center,
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
                                  Image.network(e.awayLogo, height: 40),
                                  Height(1.5.h),
                                  Text(e.away,
                                      style: CustomTheme.bodyText.copyWith(
                                        fontSize: width * font12,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isVisible && entry.key == index
                        ? MatchDetails(e)
                        : Container(),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      }
      return Container();
    });
  }
}
