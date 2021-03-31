import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'match_lineup.dart';
import 'match_overview.dart';
import 'match_stats.dart';

class MatchDetails extends StatelessWidget {
  final MatchesModel matchesModel;

  MatchDetails(this.matchesModel);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: 1500,
      margin: EdgeInsets.symmetric(vertical: 1.0.h),
      //padding: EdgeInsets.symmetric(vertical: 1.0.h),

      decoration: BoxDecoration(border: Border.all(color: CustomTheme.grey3)),
      child: tabs(context, matchesModel),
    );
  }
}

DefaultTabController tabs(BuildContext context, MatchesModel matchesModel) {
  return DefaultTabController(
      length: 3,
      child: new Scaffold(
        body: TabBarView(
          children: <Widget>[
            MatchOverView(matchesModel),
            MatchStats(matchesModel),
            MatchLineup(matchesModel),
          ],
        ),
        appBar: new TabBar(
          tabs: [
            Tab(
              child: Text(
                'Overview',
              ),
            ),
            Tab(
              child: Text(
                'Statistics',
              ),
            ),
            Tab(
              child: Text(
                'Lineups',
              ),
            ),
          ],
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.0, color: CustomTheme.accent1),
              insets: EdgeInsets.symmetric(horizontal: 40.0)),
          labelStyle: CustomTheme.bodyText2,
          labelColor: CustomTheme.accent1,
          unselectedLabelColor: CustomTheme.grey3,
        ),
      ));
}
