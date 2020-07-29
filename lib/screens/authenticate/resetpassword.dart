import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.lock,
                  color: Appcolors.ButtonColor,
                  size: SizeConfig.safeBlockHorizontal * 20,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize:
                          SizeConfig.safeBlockHorizontal * FontSize.font18,
                      color: Appcolors.TextHeading,
                      fontFamily: FontFamily.futuraHeavy,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Text(
                  'We just need your email address \n to send you the password reset',
                  softWrap: true,
                  style: TextStyle(
                      color: Appcolors.LabelText,
                      fontFamily: FontFamily.futuraMedium,
                      fontSize:
                          SizeConfig.safeBlockHorizontal * FontSize.font14),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    autofocus: false,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Type your Email',
                      hintStyle: TextStyle(
                          fontSize:
                              SizeConfig.safeBlockHorizontal * FontSize.font14,
                          fontFamily: FontFamily.futuraMedium),
                    ),
                    style: TextStyle(color: Colors.black),
                    validator: (val) =>
                        val.isEmpty ? 'Enter your full name' : null,
                    onChanged: (val) {
                      // setState(() => fullName = val);
                    }),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 7,
                  width: SizeConfig.screenWidth * 0.7,
                  child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      color: Appcolors.ButtonColor,
                      child: new Text('Send Reset Link',
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'FuturaMedium')),
                      onPressed: () async {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
