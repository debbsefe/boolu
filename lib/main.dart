import 'package:flutter/material.dart';
import 'screens/authenticate/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Futura',
        scaffoldBackgroundColor: Color.fromRGBO(245, 246, 249, 1.0),
      ),
      home: Onboarding(),
    );
  }
}
