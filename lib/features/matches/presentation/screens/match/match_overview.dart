import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:recase/recase.dart';

class MatchOverView extends StatelessWidget {
  final MatchesModel matchesModel;

  MatchOverView(this.matchesModel);
  static const String redCard = 'assets/images/redcard.png';
  static const String yellowCard = 'assets/images/yellowcard.png';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    List goals = matchesModel.goalScorers;
    List cards = matchesModel.card;
    var newList = [...goals, ...cards];
    newList.sort((a, b) => a['time'].compareTo(b['time']));
    return Column(
      children: newList.map((e) {
        String homeScorer = e['home_scorer'];
        String homeAssist = e['home_assist'];
        String awayAssist = e['away_assist'];
        String awayScorer = e['away_scorer'];
        String scores = e['score'];
        String time = e['time'];
        String homeFault = e['home_fault'];
        String awayFault = e['away_fault'];
        String card = e['card'];

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: homeFault == null
              ? CustomTheme.black24
              : CustomTheme.scaffoldColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                        homeScorer == null
                            ? ''
                            : homeScorer.isEmpty
                                ? awayScorer
                                : homeScorer,
                        style: CustomTheme.title
                            .copyWith(fontSize: width * font12)),
                    Text(
                        homeAssist == null
                            ? ''
                            : homeAssist.isEmpty
                                ? awayAssist
                                : homeAssist,
                        style: CustomTheme.subtitleItalic
                            .copyWith(fontSize: width * font10)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("$time'" ?? '',
                        style: CustomTheme.bodyText
                            .copyWith(fontSize: width * font16)),
                    Text(scores ?? '',
                        style: CustomTheme.bodyTextBold
                            .copyWith(fontSize: width * font18)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Width(20),
                    Column(
                      children: [
                        Text(
                            homeFault == null
                                ? ''
                                : homeFault.isEmpty
                                    ? awayFault
                                    : homeFault,
                            style: CustomTheme.title
                                .copyWith(fontSize: width * font12)),
                        Text((card ?? '').titleCase,
                            style: CustomTheme.subtitleItalic.copyWith(
                                fontSize: width * font8,
                                color: CustomTheme.grey3)),
                      ],
                    ),
                    Width(10),
                    card == null
                        ? Container()
                        : Image.asset(
                            card.contains('red') ? redCard : yellowCard,
                            scale: 3,
                          )
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
