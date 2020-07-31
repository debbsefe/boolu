import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

class Strings {
  static const String premierLeague = 'ENGLAND: Premier League';
  static const String laLiga = 'SPAIN: La Liga';
  static const String serieA = 'ITALY: Serie A';
}

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({this.text});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      text,
      style: TextStyle(
          color: Appcolors.LightBlueCard,
          fontSize: SizeConfig.blockSizeHorizontal * FontSize.font18),
    );
  }
}
