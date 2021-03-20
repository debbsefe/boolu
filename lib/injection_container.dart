import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/matches/data/datasources/match_local_data_source.dart';
import 'features/matches/data/datasources/match_remote_data_source.dart';
import 'features/matches/data/repositories/match_repository_impl.dart';
import 'features/matches/domain/repositories/match_repositories.dart';
import 'features/matches/domain/usecases/get_matches.dart';
import 'features/matches/presentation/bloc/matches/bloc/matches_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => MatchesBloc(
      getLeagueMatches: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLeagueMatches(sl()));

  // Repository
  sl.registerLazySingleton<MatchRepository>(
    () => MatchRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MatchRemoteDataSource>(
    () => MatchRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<MatchLocalDataSource>(
    () => MatchLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
