import 'package:boolu/model/user.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:boolu/services/auth.dart';
import 'package:boolu/services/dynamiclinks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    SizeConfig().init(context);
    final user = Provider.of<User>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * FontSize.font24,
                    color: Appcolors.TextHeading,
                    fontFamily: FontFamily.futuraHeavy,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 6),
                child: Container(
                  color: Colors.white,
                  height: SizeConfig.screenHeight * 0.7,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.person,
                              ),
                              onPressed: () => null,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 2,
                            ),
                            GestureDetector(
                              onTap: () => null,
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontFamily: FontFamily.futuraMedium,
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () => null,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 2,
                            ),
                            GestureDetector(
                              onTap: () async => await DynamicLinks()
                                  .createDynamicLink(user.uid),
                              child: Text(
                                'Refer a friend',
                                style: TextStyle(
                                    fontFamily: FontFamily.futuraMedium,
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () => null,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 2,
                            ),
                            GestureDetector(
                              onTap: () => null,
                              child: Text(
                                'Rate Us',
                                style: TextStyle(
                                    fontFamily: FontFamily.futuraMedium,
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.exit_to_app),
                              onPressed: () async {
                                await _auth.signOut();
                              },
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 2,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _auth.signOut();
                              },
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    fontFamily: FontFamily.futuraMedium,
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
