import 'package:boolu/screens/livescores/livescoreshome.dart';
import 'package:boolu/screens/livescores/results.dart';
import 'package:boolu/screens/livescores/standings.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';

class LiveScoresTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PremierLeague',
          style: TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.futuraMedium,
              fontSize: SizeConfig.safeBlockHorizontal * FontSize.font18),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: tabs(),
    );
  }
}

DefaultTabController tabs() {
  return DefaultTabController(
    length: 3,
    child: new Scaffold(
      body: TabBarView(
        children: <Widget>[
          Container(
            child: LiveScoreHome(),
          ),
          Container(child: LiveScoreStanding()),
          Container(child: LiveScoresResult()),
        ],
      ),
      drawerScrimColor: Colors.black,
      appBar: new TabBar(
        tabs: [
          Tab(
              child: TextWidget(
            text: 'Home',
          )),
          Tab(
              child: TextWidget(
            text: 'Standing',
          )),
          Tab(
              child: TextWidget(
            text: 'Results',
          )),
        ],
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Appcolors.TextHeading,
      ),
    ),
  );
}
