import 'package:boolu/screens/authenticate/onboarding.dart';
import 'package:boolu/screens/authenticate/register.dart';
import 'package:boolu/screens/authenticate/resetpassword.dart';
import 'package:boolu/screens/shared/loading.dart';
import 'package:boolu/screens/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool register = false;
  bool onboarding = false;
  String email = '';
  String password = '';
  bool checkBox = false;
  String error = '';

  void changeCheck(bool newValue) => setState(() {
    checkBox = newValue;
  });

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
                    key: _formKey,
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
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 15.0, 15.0, 0.0),
                              child: new TextFormField(
                                
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  autofocus: false,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'email address', prefixIcon: Icon(Icons.person),),
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
                                  autofocus: false,
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Password', prefixIcon: Icon(Icons.lock),),
                                  style: TextStyle(color: Colors.black),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an Email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                   ''                                        
                                  ),                         
                            FlatButton(
                                child: new Text('Forgot Password?',
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700, color: Color.fromRGBO(49, 43, 43, 1.0), fontFamily: 'FuturaMedium')),
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
                                  Checkbox(value: checkBox, onChanged: changeCheck),
                                  Text('Keep me logged in', style: new TextStyle(
                                        color: Color.fromRGBO(49, 43, 43, 1.0), fontFamily: 'FuturaMedium')),
                                ],
                                ),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 20.0),
                                child: SizedBox(
                                  height: 60.0,
                                  child: new FlatButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0)),
                                    color: Color.fromRGBO(1, 6, 38, 1.0),
                                    child: new Text('Login',
                                        style: new TextStyle(
                                            fontSize: 20.0, color: Colors.white, fontFamily: 'FuturaMedium')),
                                    onPressed: () async {
                                      // if (_formKey.currentState.validate()) {
                                      //   setState(() => loading = true);
                                        // dynamic result = await _auth
                                        //     .signInWithEmail(email, password);
                                          
                                        // if (result == null){
                                          
                                        //   setState(() {
                                        //     error = 'Invalid email or password';
                                        //     loading = false;
                                        //   });
                                        // }
                                      //}
                                    },
                                  ),

                                )),
                                FlatButton(
                              child: new Text('Don\'t have an account? Register ',
                                  style: new TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300, color: Color.fromRGBO(49, 43, 43, 1.0), fontFamily: 'FuturaMedium')),
                              onPressed: () {
                                setState(() {
                                    register = true;
                                });
                                
                              },
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