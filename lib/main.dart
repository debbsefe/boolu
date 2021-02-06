import 'package:Boolu/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/matches/domain/repositories/api_service.dart';
import 'features/matches/presentation/bloc/matches_bloc.dart';
import 'features/matches/presentation/screens/home.dart';
import 'features/matches/presentation/screens/home_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return BlocProvider(
            create: (context) => MatchesBloc(ApiService()),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeTab(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: CustomTheme.scaffoldColor,
              ),
            ),
          );
        });
      },
    );
  }
}
