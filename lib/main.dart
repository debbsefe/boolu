import 'package:flutter/material.dart';
import 'screens/authenticate/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(229, 229, 229, 0.1),
      ),
      home: Onboarding(),
    );
  }
}
