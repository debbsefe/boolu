import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:Boolu/features/matches/domain/repositories/match_repositories.dart';
import 'package:Boolu/features/matches/domain/usecases/get_matches.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMatchRepository extends Mock implements MatchRepository {}

void main() {
  GetLeagueMatches usecase;
  MockMatchRepository mockMatchRepository;

  setUp(() {
    mockMatchRepository = MockMatchRepository();
    usecase = GetLeagueMatches(mockMatchRepository);
  });

  final String dateFrom = '2021-03-02';
  final String dateTo = '2021-03-02';

  final tMatchModel = [
    MatchesModel(
        home: 'Arsenal',
        away: 'Chelsea',
        awayLogo: '1',
        awayscore: '1',
        competitionLogo: '1',
        competitionName: 'Championshop',
        homeLogo: '1',
        homescore: '1',
        venue: '1',
        matchTime: '1')
  ];

  test(
    'should get matches for the params from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getMatches is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockMatchRepository.getMatches(any, any))
          .thenAnswer((_) async => Right(tMatchModel));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(dateFrom: dateFrom, dateTo: dateTo));
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tMatchModel));
      // Verify that the method has been called on the Repository
      verify(mockMatchRepository.getMatches(dateFrom, dateTo));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockMatchRepository);
    },
  );
}
