import 'dart:async';

import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/dialogs.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:boolu/services/auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  int _state = 0;
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    var email = new TextEditingController();

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
            child: Form(
              key: _formKey,
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
                    controller: email,
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Type your Email',
                      hintStyle: TextStyle(
                          fontSize:
                              SizeConfig.safeBlockHorizontal * FontSize.font14,
                          fontFamily: FontFamily.futuraMedium),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontFamily.futuraMedium),
                    validator: (val) =>
                        val.isEmpty ? 'Email cannot be empty' : null,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 4,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.screenWidth * 0.7,
                    child: new FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 6,
                        )),
                        color: Appcolors.ButtonColor,
                        child: setUpButtonChild(context),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (_state == 0) {
                              animateButton();
                            }
                            dynamic result =
                                await _auth.resetPassword(email.text);
                            result == 'success'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SuccessDialog(
                                            text:
                                                'Password reset successful, \n please check your email inbox')))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FailureDialog(
                                            text: 'Email does not exist')));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  setUpButtonChild(BuildContext context) {
    if (_state == 0 || _state == 2) {
      return new Text(
        "Send Reset Link",
        style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * FontSize.font20,
            fontFamily: FontFamily.futuraMedium),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
