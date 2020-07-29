import 'package:boolu/screens/authenticate/onboarding.dart';
import 'package:boolu/screens/authenticate/signin.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/loading.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:boolu/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool signin = false;
  bool onboarding = false;
  String email = '';
  String password = '';
  bool checkBox = false;
  String error = '';
  String fullName = '';

  void changeCheck(bool newValue) => setState(() {
        checkBox = newValue;
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return loading
        ? Loading()
        : signin
            ? SignIn()
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
                            padding: const EdgeInsets.fromLTRB(
                                30.0, 100.0, 30.0, 0.0),
                            child:
                                ListView(shrinkWrap: true, children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Register',
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Color.fromRGBO(166, 146, 50, 1.0),
                                      fontFamily: 'FuturaHeavy',
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Create your account',
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Color.fromRGBO(166, 146, 50, 1.0),
                                      fontFamily: 'FuturaHeavy',
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    decoration: textInputDecoration.copyWith(
                                      hintText: 'Full Name',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your full name'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => fullName = val);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    decoration: textInputDecoration.copyWith(
                                      hintText: 'email address',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an Email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: new TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                    obscureText: true,
                                    autofocus: false,
                                    decoration: textInputDecoration.copyWith(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    validator: (val) => val.length < 6
                                        ? 'Password cannot be less than characters'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    }),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBox, onChanged: changeCheck),
                                  Text('I accept the terms and condition',
                                      style: new TextStyle(
                                          color:
                                              Color.fromRGBO(49, 43, 43, 1.0),
                                          fontFamily: 'FuturaMedium')),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      40.0, 25.0, 40.0, 20.0),
                                  child: SizedBox(
                                    height: 60.0,
                                    child: new FlatButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.0)),
                                      color: Color.fromRGBO(1, 6, 38, 1.0),
                                      child: new Text('Register',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontFamily: 'FuturaMedium')),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result =
                                              await _auth.registerWithEmail(
                                                  email.trim(),
                                                  password,
                                                  fullName.trim());

                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'Invalid email or password';
                                              loading = false;
                                            });
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
                                    child: Container(
                                        height:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        color: Appcolors.ButtonColor,
                                        child: Image.asset(
                                            'assets/images/google.png')),
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
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Already have an account?',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  49, 43, 43, 1.0),
                                              fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Login',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        251, 187, 0, 1),
                                                    fontSize: 14),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        setState(() {
                                                          signin = true;
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
}
