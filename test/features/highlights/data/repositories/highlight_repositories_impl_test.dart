import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/network/network_info.dart';
import 'package:Boolu/features/highlights/data/datasources/highlight_local_data_source.dart';
import 'package:Boolu/features/highlights/data/datasources/highlight_remote_data_source.dart';
import 'package:Boolu/features/highlights/data/models/scorebat_highlight_model.dart';
import 'package:Boolu/features/highlights/data/repositories/highlight_repositories_impl.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements HighLightRemoteDataSource {}

class MockLocalDataSource extends Mock implements HighLightLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  HighLightRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = HighLightRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getHighlights', () {
    final List<ScorebatHighlightModel> tHighlightModel = [
      ScorebatHighlightModel(
          title: 'Arsenal',
          thumbnail: 'Chelsea',
          embed: '1',
          url: '1',
          side1: Side1(name: 'na', url: ''),
          side2: Side1(name: 'na', url: ''))
    ];

    final List<HighLightModel> tHighlight = tHighlightModel;

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getHighLights();
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
          when(mockRemoteDataSource.getAllHighLights())
              .thenAnswer((_) async => tHighlightModel);
          // act
          final result = await repository.getHighLights();
          // assert
          verify(mockRemoteDataSource.getAllHighLights());
          expect(result, equals(Right(tHighlight)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllHighLights())
              .thenAnswer((_) async => tHighlightModel);
          // act
          await repository.getHighLights();
          // assert
          verify(mockRemoteDataSource.getAllHighLights());
          verify(mockLocalDataSource.cacheHighlight(tHighlightModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllHighLights())
              .thenThrow(ServerException());
          // act
          final result = await repository.getHighLights();
          // assert
          verify(mockRemoteDataSource.getAllHighLights());
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
          when(mockLocalDataSource.getLastHighlight())
              .thenAnswer((_) async => tHighlightModel);
          // act
          final result = await repository.getHighLights();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastHighlight());
          expect(result, equals(Right(tHighlight)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastHighlight())
              .thenThrow(CacheException());
          // act
          final result = await repository.getHighLights();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastHighlight());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
