import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final VoidCallback onTap;
  final String bgImage;
  final Color bgColor;
  final Color borderColor;
  final String text;
  final String logoImage;

  HomeCard(
      {this.onTap,
      this.bgImage,
      this.bgColor,
      this.borderColor,
      this.text,
      this.logoImage});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.safeBlockVertical * 25,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(bgImage))),
        child: Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                child: Image.asset(logoImage),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Appcolors.CardWhiteText,
                    fontFamily: FontFamily.futuraHeavy,
                    fontSize: SizeConfig.safeBlockHorizontal * FontSize.font18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
