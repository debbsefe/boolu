import 'dart:async';

import 'package:boolu/screens/authenticate/onboarding.dart';
import 'package:boolu/screens/authenticate/register.dart';
import 'package:boolu/screens/authenticate/resetpassword.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/dialogs.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/loading.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:boolu/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool register = false;
  bool onboarding = false;
  String email = '';
  String password = '';
  bool checkBox = false;
  int _state = 0;
  bool loading = false;

  void changeCheck(bool newValue) => setState(() {
        checkBox = newValue;
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return loading
        ? Loading()
        : register
            ? Register()
            : onboarding
                ? Onboarding()
                : Scaffold(
                    body: Container(
                      child: Stack(children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Color.fromRGBO(245, 246, 249, 1.0)
                                    .withOpacity(0.1),
                                BlendMode.dstATop),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/soccer.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 6.5,
                                top: SizeConfig.safeBlockHorizontal * 40,
                                right: SizeConfig.safeBlockHorizontal * 6.5,
                                bottom: 0.0),
                            child:
                                ListView(shrinkWrap: true, children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 4,
                                    top: SizeConfig.safeBlockHorizontal * 4,
                                    right: SizeConfig.safeBlockHorizontal * 4,
                                    bottom: 0.0),
                                child: Text(
                                  'Hi There!',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font24,
                                    color: Appcolors.TextHeading,
                                    fontFamily: FontFamily.futuraHeavy,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 4,
                                    top: SizeConfig.safeBlockHorizontal * 4,
                                    right: SizeConfig.safeBlockHorizontal * 4,
                                    bottom: 0.0),
                                child: Text(
                                  'Welcome back',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal *
                                        FontSize.font24,
                                    color: Appcolors.TextHeading,
                                    fontFamily: FontFamily.futuraHeavy,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 4,
                                    top: SizeConfig.safeBlockHorizontal * 4,
                                    right: SizeConfig.safeBlockHorizontal * 4,
                                    bottom: 0.0),
                                child: new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    decoration: textInputDecoration.copyWith(
                                      hintText: 'email address',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: FontFamily.futuraMedium),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an Email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 4,
                                    top: SizeConfig.safeBlockHorizontal * 4,
                                    right: SizeConfig.safeBlockHorizontal * 4,
                                    bottom: 0.0),
                                child: new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    obscureText: true,
                                    decoration: textInputDecoration.copyWith(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter password' : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(''),
                                  FlatButton(
                                    child: new Text('Forgot Password?',
                                        style: new TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  FontSize.font13,
                                          color: Appcolors.LabelText,
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ResetPassword()));
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBox, onChanged: changeCheck),
                                  Text('Keep me logged in',
                                      style: new TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal *
                                                FontSize.font11,
                                        color: Appcolors.LabelText,
                                      )),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 11,
                                      top: SizeConfig.safeBlockHorizontal * 6,
                                      right:
                                          SizeConfig.safeBlockHorizontal * 11,
                                      bottom:
                                          SizeConfig.safeBlockHorizontal * 5.5),
                                  child: SizedBox(
                                    height: SizeConfig.safeBlockVertical * 7,
                                    child: new FlatButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(
                                                  SizeConfig
                                                          .safeBlockHorizontal *
                                                      6)),
                                      color: Appcolors.ButtonColor,
                                      child: setUpButtonChild(context),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          if (_state == 0) {
                                            animateButton();
                                          }

                                          dynamic result = await _auth
                                              .signInWithEmail(email, password);

                                          if (result == null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => FailureDialog(
                                                        text:
                                                            'Oops! Looks like you have not signed up! Please register with your email or sign in with a valid email address')));
                                          }
                                        }
                                      },
                                    ),
                                  )),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Or with social:',
                                    style: TextStyle(
                                        color: Appcolors.LabelText,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal *
                                                FontSize.font14),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockHorizontal * 6),
                                    child: GestureDetector(
                                      onTap: () async {
                                        setState(() => loading = true);
                                        dynamic result =
                                            await _auth.signInWithGoogle();

                                        if (result == null) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => FailureDialog(
                                                      text:
                                                          'An error occured, please try again')));
                                        }
                                      },
                                      child: Container(
                                          height:
                                              SizeConfig.blockSizeHorizontal *
                                                  10,
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  10,
                                          color: Appcolors.ButtonColor,
                                          child: Image.asset(
                                              'assets/images/google.png')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockHorizontal * 6),
                                    child: Container(
                                        height:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        color: Appcolors.ButtonColor,
                                        child: Image.asset(
                                            'assets/images/facebook.png')),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 2,
                              ),
                              Container(
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockSizeHorizontal * 3),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Don\'t have an account?',
                                          style: TextStyle(
                                              color: Appcolors.LabelText,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal *
                                                  FontSize.font14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Register',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        251, 187, 0, 1),
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                        FontSize.font14),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        setState(() {
                                                          register = true;
                                                        });
                                                      })
                                          ]),
                                    ),
                                  ))
                            ]),
                          ),
                        )
                      ]),
                    ),
                  );
  }

  setUpButtonChild(BuildContext context) {
    if (_state == 0 || _state == 2) {
      return new Text(
        "Login",
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
