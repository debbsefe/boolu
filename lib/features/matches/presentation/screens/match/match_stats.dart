import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:recase/recase.dart';

class MatchStats extends StatelessWidget {
  final MatchesModel matchesModel;

  MatchStats(this.matchesModel);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    List stats = matchesModel.stats;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: stats.map((e) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e['home'],
                    style: CustomTheme.bodyText
                        .copyWith(fontSize: width * font14)),
                Text(e['type'],
                    style:
                        CustomTheme.italic.copyWith(fontSize: width * font12)),
                Text(e['away'],
                    style: CustomTheme.bodyText
                        .copyWith(fontSize: width * font14)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
