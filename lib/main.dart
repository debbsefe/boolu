import 'package:boolu/model/user.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/wrapper.dart';
import 'package:boolu/services/api.dart';
import 'package:boolu/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/shared/appcolors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        FutureProvider(
          create: (context) => Api().fetchSport(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: FontFamily.futuraMedium,
          primaryColor: Appcolors.ScaffoldColor,
          // primarySwatch: Appcolors.ScaffoldColor,
          scaffoldBackgroundColor: Appcolors.ScaffoldColor,
        ),
        home: Wrapper(),
      ),
    );
  }
}
