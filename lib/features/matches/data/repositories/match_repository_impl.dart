import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/network/network_info.dart';
import 'package:Boolu/features/matches/data/datasources/match_local_data_source.dart';
import 'package:Boolu/features/matches/data/datasources/match_remote_data_source.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:Boolu/features/matches/domain/repositories/match_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchRemoteDataSource remoteDataSource;
  final MatchLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  MatchRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<MatchesModel>>> getMatches(
      String dateFrom, String dateTo) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await remoteDataSource.getLeagueMatches(dateFrom, dateTo);
        localDataSource.cacheMatch(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastMatch();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
