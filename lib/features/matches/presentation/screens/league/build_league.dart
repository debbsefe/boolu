import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/data/models/fetchMatchModel.dart';
import 'package:Boolu/features/matches/presentation/bloc/matches/bloc/matches_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    final weatherBloc = BlocProvider.of<MatchesBloc>(context, listen: false);

    weatherBloc.add(GetMatches("2021", todayWithoutTime, todayWithoutTime));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: CustomTheme.grey3)),
          child: BlocBuilder<MatchesBloc, MatchesState>(
            builder: (context, state) {
              if (state is MatchesLoading) {
                return CircularProgressIndicator();
              } else if (state is MatchesError) {
                return Text(state.error.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * font12,
                    ));
              } else if (state is MatchesLoaded) {
                return Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/calendar_icon.png')),
                    Expanded(
                      flex: 5,
                      child: Text(
                          state.fetchMatches.competition.name.toUpperCase() ??
                              '',
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
                );
              } else {
                return Text('');
              }
            },
          ),
        ),
        Height(3.0.h),
        BlocBuilder<MatchesBloc, MatchesState>(
          builder: (context, state) {
            if (state is MatchesLoading) {
              return CircularProgressIndicator();
            } else if (state is MatchesError) {
              return Text(state.error.message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * font12,
                  ));
            } else if (state is MatchesLoaded) {
              List<Matches> matches = state.fetchMatches.matches;
              return matches.isEmpty
                  ? Center(
                      child: Text(
                        'No Premier League match for this day',
                        style: CustomTheme.bodyTextBold,
                      ),
                    )
                  : Column(
                      children: matches.map((e) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: CustomTheme.grey3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/calendar_icon.png'),
                                    Height(1.5.h),
                                    Text(e.homeTeam.name,
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
                                        e.score.fullTime.homeTeam.toString() +
                                            ':' +
                                            e.score.fullTime.awayTeam
                                                .toString(),
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
                                        style:
                                            CustomTheme.bodyTextBold.copyWith(
                                          fontSize: width * font10,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/calendar_icon.png'),
                                    Height(1.5.h),
                                    Text(e.awayTeam.name,
                                        style: CustomTheme.bodyText.copyWith(
                                          fontSize: width * font12,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
            }
            return Text('');
          },
        ),
      ],
    );
  }
}
