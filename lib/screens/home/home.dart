import 'package:boolu/model/api.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(
              SizeConfig.safeBlockHorizontal * 18,
            ),
            child: Text(
              'Matches For You Today',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3,
                  color: Appcolors.TextHeading,
                  fontFamily: FontFamily.futuraHeavy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Text(
            today,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamily.futuraLight,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => League(
                          sport: data,
                        ))),
            child: Padding(
              padding: EdgeInsets.all(
                SizeConfig.safeBlockHorizontal * 3,
              ),
              child: Container(
                height: SizeConfig.safeBlockVertical * 15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-premier.png'))),
                child: Card(
                  color: Appcolors.BlueCard,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Appcolors.BlueCardBorder,
                      ),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset('assets/images/premierlogo.png'),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 25,
                        ),
                        child: Text(
                          'Premier League',
                          style: TextStyle(
                            color: Appcolors.CardWhiteText,
                            fontFamily: FontFamily.futuraHeavy,
                            fontSize: SizeConfig.safeBlockHorizontal * 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
