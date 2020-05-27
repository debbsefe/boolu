import 'package:boolu/screens/authenticate/register.dart';
import 'package:boolu/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  bool showRegister = false;
  bool showSignIn  = false;

  @override
  Widget build(BuildContext context) {
    return showRegister ? Register() : showSignIn ? SignIn() : Scaffold(
      body: 
       Stack(
          children: <Widget>[
            Positioned(
              left: 100,
              top: 0,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                 decoration : BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/footballplayer.png'
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
               right: 70,
              top: 300,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.height * 0.5,                 
              child: Container(
                   decoration : BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Group6.png'
                        //'https://res.cloudinary.com/debbsefe/image/upload/v1590538048/Group6_axuxzi.png'
                      ),
                    ),
                  ),
                ),
            ),
            Positioned(
              bottom: 20,
              left: 22,
              right: 22,
              //width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                              showSignIn = true;
                            });
                        },
                        elevation: 7.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        color: Color.fromRGBO(1,6,38, 1.0),
                        child: new Text('Login',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                              showRegister = true;
                            });
                        },
                        elevation: 7.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        color: Color.fromRGBO(50,97,115, 1.0),
                        child: new Text('Register',
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white,)),
                      ),
                    ),
                  ],
                ),
              ]          
              ),
            ),
          ]
        ),
    );
  }
}