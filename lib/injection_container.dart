import 'package:Boolu/features/highlights/presentation/blocs/highlight/highlight_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/highlights/data/datasources/highlight_local_data_source.dart';
import 'features/highlights/data/datasources/highlight_remote_data_source.dart';
import 'features/highlights/data/repositories/highlight_repositories_impl.dart';
import 'features/highlights/domain/repositories/highlight_repositories.dart';
import 'features/highlights/domain/usecases/get_highlights.dart';
import 'features/matches/data/datasources/match_local_data_source.dart';
import 'features/matches/data/datasources/match_remote_data_source.dart';
import 'features/matches/data/repositories/match_repository_impl.dart';
import 'features/matches/domain/repositories/match_repositories.dart';
import 'features/matches/domain/usecases/get_matches.dart';
import 'features/matches/presentation/bloc/matches/bloc/matches_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // Bloc
  sl.registerFactory<MatchesBloc>(
    () => MatchesBloc(
      getLeagueMatches: sl(),
    ),
  );

  sl.registerFactory<HighlightBloc>(
    () => HighlightBloc(
      getHighLights: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLeagueMatches(sl()));
  sl.registerLazySingleton(() => GetHighLights(sl()));

  // Repository
  sl.registerLazySingleton<MatchRepository>(
    () => MatchRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<HighLightRepository>(
    () => HighLightRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<MatchRemoteDataSource>(
    () => MatchRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<HighLightRemoteDataSource>(
    () => HighLightRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<MatchLocalDataSource>(
    () => MatchLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<HighLightLocalDataSource>(
    () => HighLightLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
