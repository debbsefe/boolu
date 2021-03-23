import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:recase/recase.dart';
import 'package:sizer/sizer.dart';

class MatchLineup extends StatelessWidget {
  final MatchesModel matchesModel;

  MatchLineup(this.matchesModel);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    String homeLineUp = matchesModel.homeLineUp;
    String awayLineUp = matchesModel.awayLineUp;
    dynamic lineup = matchesModel.lineups;
    List homesubs = lineup['home']['substitutes'];
    List awaysubs = lineup['away']['substitutes'];
    String homecoach = lineup['home']['coach'][0]['lineup_player'];
    String awaycoach = lineup['away']['coach'][0]['lineup_player'];

    print('subs ${homecoach}');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Height(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(matchesModel.homeLogo, height: 40),
                Width(20),
                Text(matchesModel.home,
                    style: CustomTheme.bodyText.copyWith(
                      fontSize: width * font12,
                    )),
              ],
            ),
            Text(homeLineUp,
                style: CustomTheme.bodyText.copyWith(fontSize: width * font14)),
          ],
        ),
        Height(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(matchesModel.awayLogo, height: 40),
                Width(20),
                Text(matchesModel.away,
                    style: CustomTheme.bodyText.copyWith(
                      fontSize: width * font12,
                    )),
              ],
            ),
            Text(awayLineUp,
                style: CustomTheme.bodyText.copyWith(fontSize: width * font14)),
          ],
        ),
        Height(30),
        Text(
          'substitute players'.toUpperCase(),
          style: CustomTheme.navbarText1.copyWith(
              fontSize: width * font12, color: Colors.white.withOpacity(0.85)),
        ),
        Height(30),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration:
                BoxDecoration(border: Border.all(color: CustomTheme.grey3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(matchesModel.homeLogo, height: 30),
                          Width(10),
                          Text(matchesModel.home,
                              style: CustomTheme.bodyText.copyWith(
                                fontSize: width * font10,
                              )),
                        ],
                      ),
                      Height(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: homesubs.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Text(
                                  e['lineup_number'],
                                  style: CustomTheme.navbarText1.copyWith(
                                      fontSize: width * font10,
                                      color: Colors.white.withOpacity(0.85)),
                                ),
                                Width(20),
                                Text(
                                  e['lineup_player'],
                                  style: CustomTheme.navbarText1.copyWith(
                                      fontSize: width * font10,
                                      color: Colors.white.withOpacity(0.85)),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Height(20),
                      Row(
                        children: [
                          Width(20),
                          Text(
                            homecoach,
                            style: CustomTheme.navbarText1.copyWith(
                                fontSize: width * font10,
                                color: Colors.white.withOpacity(0.85)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(matchesModel.awayLogo, height: 30),
                          Width(10),
                          Text(matchesModel.away,
                              style: CustomTheme.bodyText.copyWith(
                                fontSize: width * font10,
                              )),
                        ],
                      ),
                      Height(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: awaysubs.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: [
                                Text(
                                  e['lineup_number'],
                                  style: CustomTheme.navbarText1.copyWith(
                                      fontSize: width * font10,
                                      color: Colors.white.withOpacity(0.85)),
                                ),
                                Width(10),
                                Text(
                                  e['lineup_player'],
                                  style: CustomTheme.navbarText1.copyWith(
                                      fontSize: width * font10,
                                      color: Colors.white.withOpacity(0.85)),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Height(20),
                      Row(
                        children: [
                          Width(20),
                          Text(
                            awaycoach,
                            style: CustomTheme.navbarText1.copyWith(
                                fontSize: width * font10,
                                color: Colors.white.withOpacity(0.85)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
