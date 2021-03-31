import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';

class MatchLineup extends StatelessWidget {
  final MatchesModel matchesModel;

  MatchLineup(this.matchesModel);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    String homeLineUp = matchesModel.homeLineUp;
    String awayLineUp = matchesModel.awayLineUp;
    List<Subtitutes> _lineupHome = matchesModel.lineupHome;
    List<Subtitutes> _lineupAway = matchesModel.lineupAway;
    var home = homeLineUp.split('-');
    print('homeLineUp${home.isEmpty}');

    var home1 = homeLineUp.isEmpty ? null : int.parse(home[0]) + 1;
    var home2 = home.length < 2 ? null : int.parse(home[1]) + home1;
    var home3 = home.length < 3 ? null : int.parse(home[2]) + home2;
    var home4 = home.length < 4 ? null : int.parse(home[3]) + home3;

    var away = awayLineUp.split('-');
    var away1 = awayLineUp.isEmpty ? null : int.parse(away[0]) + 1;
    var away2 = away.length < 2 ? null : int.parse(away[1]) + away1;
    var away3 = away.length < 3 ? null : int.parse(away[2]) + away2;
    var away4 = away.length < 4 ? null : int.parse(away[3]) + away3;

    //sort lineuphome and away in ascending order
    _lineupHome.sort((a, b) =>
        int.parse(a.lineupPosition).compareTo(int.parse(b.lineupPosition)));
    _lineupAway.sort((a, b) =>
        int.parse(a.lineupPosition).compareTo(int.parse(b.lineupPosition)));
    print('homeLineUpj${_lineupHome.isEmpty}');

    print('homeLineUp${_lineupHome.map((e) => e.lineupPosition)}');

    List<Subtitutes> homesubs = matchesModel.homeSubtitutes;
    List<Subtitutes> awaysubs = matchesModel.awaySubtitutes;
    String homecoach = matchesModel.homecoach.isEmpty
        ? ''
        : matchesModel.homecoach[0].lineupPlayer;
    String awaycoach = matchesModel.awaycoach.isEmpty
        ? ''
        : matchesModel.awaycoach[0].lineupPlayer;
    return _lineupHome.isEmpty
        ? Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/info.png', height: 20),
                Width(20),
                Text('The Line-up will be posted before the match',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * font12,
                    )),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Height(20),
                  _lineupHome.isEmpty
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/football_pitch.jpeg'))),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 5),
                                color: CustomTheme.pitchGreen,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(matchesModel.homeLogo,
                                            height: 40),
                                        Width(10),
                                        Text(matchesModel.home,
                                            style:
                                                CustomTheme.bodyText.copyWith(
                                              fontSize: width * font12,
                                            )),
                                      ],
                                    ),
                                    Text(homeLineUp,
                                        style: CustomTheme.bodyText.copyWith(
                                            fontSize: width * font14)),
                                  ],
                                ),
                              ),
                              Height(20),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: _lineupHome.take(1).map((e) {
                                    return CustomPitchText(
                                      isAway: false,
                                      playerName: e.lineupPlayer,
                                      playerNumber: e.lineupNumber,
                                    );
                                  }).toList()),
                              Height(25),
                              if (home1 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:
                                        _lineupHome.getRange(1, home1).map((e) {
                                      return CustomPitchText(
                                        isAway: false,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (home2 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupHome
                                        .getRange(home1, home2)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: false,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (home3 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupHome
                                        .getRange(home2, home3)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: false,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (home4 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupHome
                                        .getRange(home3, home4)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: false,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(50),
                              if (away4 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupAway
                                        .getRange(away3, away4)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: true,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (away3 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupAway
                                        .getRange(away2, away3)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: true,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (away2 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: _lineupAway
                                        .getRange(away1, away2)
                                        .map((e) {
                                      return CustomPitchText(
                                        isAway: true,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              if (away1 != null)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:
                                        _lineupAway.getRange(1, away1).map((e) {
                                      return CustomPitchText(
                                        isAway: true,
                                        playerName: e.lineupPlayer,
                                        playerNumber: e.lineupNumber,
                                      );
                                    }).toList()),
                              Height(25),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: _lineupAway.take(1).map((e) {
                                    return CustomPitchText(
                                      isAway: true,
                                      playerName: e.lineupPlayer,
                                      playerNumber: e.lineupNumber,
                                    );
                                  }).toList()),
                              Height(20),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 5),
                                color: CustomTheme.pitchGreen,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(matchesModel.awayLogo,
                                            height: 40),
                                        Width(20),
                                        Text(matchesModel.away,
                                            style:
                                                CustomTheme.bodyText.copyWith(
                                              fontSize: width * font12,
                                            )),
                                      ],
                                    ),
                                    Text(awayLineUp,
                                        style: CustomTheme.bodyText.copyWith(
                                            fontSize: width * font14)),
                                  ],
                                ),
                              ),
                            ],
                          )),
                  Height(50),
                  Text(
                    'substitute players'.toUpperCase(),
                    style: CustomTheme.navbarText1.copyWith(
                        fontSize: width * font12,
                        color: Colors.white.withOpacity(0.85)),
                  ),
                  Height(30),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomTheme.grey3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.network(matchesModel.homeLogo,
                                        height: 30),
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
                                      padding: const EdgeInsets.only(
                                          top: 6.0, bottom: 6.0, left: 6.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              e.lineupNumber,
                                              textAlign: TextAlign.start,
                                              style: CustomTheme.navbarText1
                                                  .copyWith(
                                                      fontSize: width * font10,
                                                      color: Colors.white
                                                          .withOpacity(0.85)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              e.lineupPlayer,
                                              textAlign: TextAlign.start,
                                              style: CustomTheme.navbarText1
                                                  .copyWith(
                                                      fontSize: width * font10,
                                                      color: Colors.white
                                                          .withOpacity(0.85)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                                Height(20),
                                Row(
                                  children: [
                                    Text(
                                      'Coach: ',
                                      style: CustomTheme.scoreText.copyWith(
                                        fontSize: width * font10,
                                      ),
                                    ),
                                    Text(
                                      homecoach,
                                      style: CustomTheme.navbarText1.copyWith(
                                          fontSize: width * font10,
                                          color:
                                              Colors.white.withOpacity(0.85)),
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
                                    Image.network(matchesModel.awayLogo,
                                        height: 30),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              e.lineupNumber,
                                              style: CustomTheme.navbarText1
                                                  .copyWith(
                                                      fontSize: width * font10,
                                                      color: Colors.white
                                                          .withOpacity(0.85)),
                                            ),
                                          ),
                                          //Width(10),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              e.lineupPlayer,
                                              style: CustomTheme.navbarText1
                                                  .copyWith(
                                                      fontSize: width * font10,
                                                      color: Colors.white
                                                          .withOpacity(0.85)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                                Height(20),
                                Row(
                                  children: [
                                    Text(
                                      'Coach: ',
                                      style: CustomTheme.scoreText.copyWith(
                                        fontSize: width * font10,
                                      ),
                                    ),
                                    Text(
                                      awaycoach,
                                      style: CustomTheme.navbarText1.copyWith(
                                          fontSize: width * font10,
                                          color:
                                              Colors.white.withOpacity(0.85)),
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

class CustomPitchText extends StatelessWidget {
  final String playerNumber, playerName;

  final bool isAway;

  const CustomPitchText(
      {Key key,
      @required this.playerNumber,
      @required this.playerName,
      @required this.isAway})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double width = SizeConfig.blockSizeHorizontal;
    return Column(
      children: [
        if (isAway)
          Text(
            playerName ?? '',
            textAlign: TextAlign.center,
            style: CustomTheme.bodyText.copyWith(
                fontSize: width * font8, color: Colors.white.withOpacity(0.60)),
          ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: CustomTheme.scaffoldColor),
          child: Text(
            playerNumber ?? '',
            textAlign: TextAlign.center,
            style: CustomTheme.bodyTextBold.copyWith(
              fontSize: width * font8,
            ),
          ),
        ),
        if (!isAway)
          Text(
            playerName ?? '',
            textAlign: TextAlign.center,
            style: CustomTheme.bodyText.copyWith(
                fontSize: width * font8, color: Colors.white.withOpacity(0.60)),
          ),
      ],
    );
  }
}
