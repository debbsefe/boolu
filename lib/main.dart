import 'package:Boolu/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'features/matches/presentation/bloc/matches/matches_bloc.dart';
import 'features/matches/presentation/cubits/calendar/calendar_cubit.dart';
import 'features/matches/presentation/cubits/navbarTextColor/navbar_text_color_cubit.dart';
import 'features/matches/presentation/screens/home_tab.dart';
import 'package:get/get.dart';
import 'injection_container.dart' as di;
import 'package:Boolu/features/highlights/presentation/blocs/highlight/highlight_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => di.sl<MatchesBloc>(),
              ),
               BlocProvider(
                create: (BuildContext context) =>  di.sl<HighlightBloc>(),
              ),
              BlocProvider(
                create: (BuildContext context) => CalendarCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => NavbarTextColorCubit(),
              ),
            ],
            child: GetMaterialApp(
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
