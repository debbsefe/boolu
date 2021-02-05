import 'package:Boolu/Logic/bloc/matches_bloc.dart';
import 'package:Boolu/Logic/bloc/matches_state.dart';
import 'package:Boolu/Logic/bloc/matches_event.dart';
import 'package:Boolu/Services/api_service.dart';
import 'package:Boolu/Utils/font_constants.dart';
import 'package:Boolu/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static const List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  static const List<String> dayh = [
    'Live',
    '02 Aug',
    '03 Aug',
    '04 Aug',
    '05 Aug',
    '06 Aug',
    '07 Aug'
  ];
  final ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: day.map((e) {
                return Text(e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * font8,
                    ));
              }).toList(),
            ),
            Row(
              children: dayh.map((e) {
                return Text(e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * font12,
                    ));
              }).toList(),
            ),
            BlocBuilder<MatchesBloc, MatchesState>(
              builder: (context, state) {
                if (state is MatchesInitial) {
                  return Text('Initial',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * font12,
                      ));
                } else if (state is MatchesLoading) {
                  return CircularProgressIndicator();
                } else if (state is MatchesLoaded) {
                  return Text(state.fetchMatches.competition.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * font12,
                      ));
                } else if (state is MatchesError) {
                  return Text(state.error.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * font12,
                      ));
                } else {
                  return Text('Initial');
                }
              },
            ),
            FlatButton(
              onPressed: () async {
                // ignore: close_sinks
                final weatherBloc = BlocProvider.of<MatchesBloc>(context);

                weatherBloc.add(
                    GetMatches("201", "2020", "2021-02-06", "2021-02-06"));
              },
              child: Text('Press me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * font12,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
