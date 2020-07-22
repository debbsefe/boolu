import 'package:boolu/model/user.dart';
import 'package:boolu/screens/wrapper.dart';
import 'package:boolu/services/api.dart';
import 'package:boolu/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          create: (context) => Api().fetchJobs(),
        ),
        ChangeNotifierProvider(
          create: (context) => Api(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Futura',
          scaffoldBackgroundColor: Color.fromRGBO(245, 246, 249, 1.0),
        ),
        home: Wrapper(),
      ),
    );
  }
}
