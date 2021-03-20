import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/network/network_info.dart';
import 'package:Boolu/features/matches/data/datasources/match_local_data_source.dart';
import 'package:Boolu/features/matches/data/datasources/match_remote_data_source.dart';
import 'package:Boolu/features/matches/data/models/api_football_event_model.dart';
import 'package:Boolu/features/matches/data/repositories/match_repository_impl.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements MatchRemoteDataSource {}

class MockLocalDataSource extends Mock implements MatchLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MatchRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MatchRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getMatches', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests

    final String dateFrom = '2021-03-02';
    final String dateTo = '2021-03-02';

    final List<ApiFootballEventModel> tMatchModel = [
      ApiFootballEventModel(
          matchHometeamName: 'Arsenal',
          matchAwayteamName: 'Chelsea',
          teamAwayBadge: '1',
          matchAwayteamScore: '1',
          leagueLogo: '1',
          leagueName: 'Championshop',
          teamHomeBadge: '1',
          matchHometeamScore: '1')
    ];

    final List<MatchesModel> tMatch = tMatchModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getMatches(dateFrom, dateTo);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo))
              .thenAnswer((_) async => tMatchModel);
          // act
          final result = await repository.getMatches(dateFrom, dateTo);
          // assert
          verify(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo));
          expect(result, equals(Right(tMatch)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo))
              .thenAnswer((_) async => tMatchModel);
          // act
          await repository.getMatches(dateFrom, dateTo);
          // assert
          verify(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo));
          verify(mockLocalDataSource.cacheMatch(tMatchModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo))
              .thenThrow(ServerException());
          // act
          final result = await repository.getMatches(dateFrom, dateTo);
          // assert
          verify(mockRemoteDataSource.getLeagueMatches(dateFrom, dateTo));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastMatch())
              .thenAnswer((_) async => tMatchModel);
          // act
          final result = await repository.getMatches(dateFrom, dateTo);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastMatch());
          expect(result, equals(Right(tMatch)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastMatch()).thenThrow(CacheException());
          // act
          final result = await repository.getMatches(dateFrom, dateTo);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastMatch());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
