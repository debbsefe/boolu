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
  final EdgeInsetsGeometry padding1;
  final EdgeInsetsGeometry padding2;

  HomeCard(
      {this.onTap,
      this.bgImage,
      this.bgColor,
      this.borderColor,
      this.text,
      this.logoImage,
      this.padding1,
      this.padding2});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.safeBlockVertical * 25,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(bgImage),
        )),
        child: Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor,
              ),
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: padding1 ?? EdgeInsets.zero,
                child: Image.asset(logoImage),
              ),
              Padding(
                padding: padding2 ?? EdgeInsets.zero,
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
