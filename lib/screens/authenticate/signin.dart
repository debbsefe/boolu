import 'package:boolu/screens/authenticate/onboarding.dart';
import 'package:boolu/screens/authenticate/register.dart';
import 'package:boolu/screens/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool loading = false;
  bool register = false;
  bool onboarding = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : register ? Register() : onboarding ? Onboarding() : Scaffold(
      
      body: Container(
        child: Stack(
                children: <Widget>[
                  Align(
                        alignment: Alignment.topRight,              
                        child: ColorFiltered(
                            colorFilter: ColorFilter.mode(Color.fromRGBO(245, 246, 249, 1.0).withOpacity(0.1), BlendMode.dstATop),    child: Container(
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
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 0.0),
                     child: ListView(
                          shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              
                                child: Text(
                                  'Hi There!',
                                  style: const TextStyle(fontSize: 24.0, color: Color.fromRGBO(166,146,50, 1.0),fontFamily: 'FuturaHeavy', fontWeight: FontWeight.w900),
                                ),
                              
                            ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                              
                                child: Text(
                                  'Welcome back',
                                  style: const TextStyle(fontSize: 24.0, color: Color.fromRGBO(166,146,50, 1.0),fontFamily: 'FuturaHeavy', fontWeight: FontWeight.w900),
                                
                              ),
                            ),
                          
                        ]
                    ),
              ),
          )
        ]
      ),
    ),
  );
  }
}