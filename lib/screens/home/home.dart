import 'package:boolu/model/api.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:boolu/screens/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:boolu/screens/home/leagues.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final today = DateFormat('d MMMM yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<Sport>>(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
        child: ListView(
          children: <Widget>[
            Text(
              'Matches For You Today',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * FontSize.font24,
                  color: Appcolors.TextHeading,
                  fontFamily: FontFamily.futuraHeavy,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1,
            ),
            Text(
              today,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: FontFamily.futuraLight,
                fontSize: SizeConfig.safeBlockHorizontal * FontSize.font14,
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            HomeCard(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => League(
                          sport: data, category: Strings.premierLeague))),
              bgImage: 'assets/images/bg-premier.png',
              bgColor: Appcolors.BlueCard,
              borderColor: Appcolors.BlueCardBorder,
              logoImage: 'assets/images/premierlogo.png',
              text: 'Premier League',
              padding1:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 7),
              padding2:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            HomeCard(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          League(sport: data, category: Strings.laLiga))),
              bgImage: 'assets/images/laligabg.png',
              bgColor: Appcolors.LightBlueCard,
              borderColor: Appcolors.LightBlueCardBorder,
              logoImage: 'assets/images/laligalogo.png',
              text: 'La Liga',
              padding1:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 14),
              padding2:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            HomeCard(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          League(sport: data, category: Strings.serieA))),
              bgImage: 'assets/images/serieAbg.png',
              bgColor: Appcolors.BlueCard,
              borderColor: Appcolors.BlueCardBorder,
              logoImage: 'assets/images/serieAlogo.png',
              text: 'Serie A',
              padding2:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
            ),
          ],
        ),
      ),
    );
  }
}
