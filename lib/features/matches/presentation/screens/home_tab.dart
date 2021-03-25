import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:flutter/material.dart';

import 'explore.dart';
import 'home.dart';

class HomeTab extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [Home(), Explore(), Explore(), Explore()];
    SizeConfig().init(context);
    final height = SizeConfig.safeBlockVertical;

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: CustomTheme.tabColor,
          ),
          child: BottomNavigationBar(
            // unselectedItemColor: Colors.grey,
            selectedItemColor: CustomTheme.accent1,
            onTap: onTabTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              bottomNavigationBar(
                  icon: 'assets/images/soccer_tab_icon.png',
                  semanticLabel: 'This is the Score Page',
                  label: 'Scores',
                  height: height),
              bottomNavigationBar(
                  icon: 'assets/images/search_tab_icon.png',
                  semanticLabel: 'This is the Search/Explore Leagues Page ',
                  label: 'Explore Leagues',
                  height: height),
              bottomNavigationBar(
                  icon: 'assets/images/highlight_tab_icon.png',
                  semanticLabel: 'This is the Video Highlights Page',
                  label: 'HighLights',
                  height: height),
              bottomNavigationBar(
                  icon: 'assets/images/settings_tab_icon.png',
                  semanticLabel: 'This is the Settings Page',
                  label: 'Settings',
                  height: height),
            ],
          ),
        ));
  }

  BottomNavigationBarItem bottomNavigationBar(
      {@required String icon,
      @required String semanticLabel,
      @required String label,
      @required double height}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        height: 20,
        semanticLabel: semanticLabel,
      ),
      activeIcon: Image.asset(
        icon,
        height: 20,
        semanticLabel: semanticLabel,
      ),
      label: label,
    );
  }
}
