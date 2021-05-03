import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/network/network_info.dart';
import 'package:Boolu/features/highlights/data/datasources/highlight_local_data_source.dart';
import 'package:Boolu/features/highlights/data/datasources/highlight_remote_data_source.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:Boolu/features/highlights/domain/repositories/highlight_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class HighLightRepositoryImpl implements HighLightRepository {
  final HighLightRemoteDataSource remoteDataSource;
  final HighLightLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  HighLightRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<HighLightModel>>> getHighLights() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHighlight = await remoteDataSource.getAllHighLights();
        localDataSource.cacheHighlight(remoteHighlight);
        return Right(remoteHighlight);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localHighlight = await localDataSource.getLastHighlight();
        return Right(localHighlight);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
