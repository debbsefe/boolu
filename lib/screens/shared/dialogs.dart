import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      backgroundColor: Appcolors.ScaffoldColor,
      scrollable: true,
      content: Container(
        width: SizeConfig.screenWidth * 0.6,
        height: SizeConfig.screenHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: SizeConfig.safeBlockHorizontal * 20,
              ),
              height: SizeConfig.safeBlockVertical * 12,
              width: SizeConfig.safeBlockHorizontal * 12,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.safeBlockHorizontal * FontSize.font18,
                  fontFamily: FontFamily.futuraMedium),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("OK",
              style: TextStyle(
                  color: Appcolors.TextHeading,
                  fontSize: SizeConfig.safeBlockHorizontal * FontSize.font14,
                  fontFamily: FontFamily.futuraMedium)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class FailureDialog extends StatelessWidget {
  const FailureDialog({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      scrollable: true,
      backgroundColor: Appcolors.ScaffoldColor,
      content: Container(
        width: SizeConfig.screenWidth * 0.6,
        height: SizeConfig.screenHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: Icon(
                Icons.cancel,
                color: Colors.red,
                size: SizeConfig.safeBlockHorizontal * 10,
              ),
              height: SizeConfig.safeBlockVertical * 12,
              width: SizeConfig.safeBlockHorizontal * 12,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.safeBlockHorizontal * FontSize.font18,
                  fontFamily: FontFamily.futuraMedium),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("OK",
              style: TextStyle(
                  color: Appcolors.TextHeading,
                  fontSize: SizeConfig.safeBlockHorizontal * FontSize.font14,
                  fontFamily: FontFamily.futuraMedium)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

Container failedNetwork(BuildContext context) {
  return Container(
      child: AlertDialog(
    actions: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            'You are Currently Offline\nYour goals will be updated when you are online',
            style: TextStyle(
                color: Colors.black, fontFamily: FontFamily.futuraMedium),
          ),
        ),
      ),
      FlatButton(
        child: Text(
          "OK",
          style: TextStyle(
              color: Appcolors.TextHeading,
              fontFamily: FontFamily.futuraMedium),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  ));
}
