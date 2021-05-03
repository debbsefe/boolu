import 'package:Boolu/core/usecases/usecase.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:Boolu/features/highlights/domain/repositories/highlight_repositories.dart';
import 'package:Boolu/features/highlights/domain/usecases/get_highlights.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHighLightRepository extends Mock implements HighLightRepository {}

void main() {
  GetHighLights usecase;
  MockHighLightRepository mockHighLightRepository;

  setUp(() {
    mockHighLightRepository = MockHighLightRepository();
    usecase = GetHighLights(mockHighLightRepository);
  });

  final tHighLightModel = [
    HighLightModel(
      videourl: [VideoUrl(url: '1')],
      embedUrl: '1',
      thumbnail: 'test',
      date: '1',
      team1: '1',
      team2: '2',
    )
  ];

  test(
    'should get highlight from the repository',
    () async {
      // arrange
      when(mockHighLightRepository.getHighLights())
          .thenAnswer((_) async => Right(tHighLightModel));
      // act
      // Since random number doesn't require any parameters, we pass in NoParams.
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tHighLightModel));
      verify(mockHighLightRepository.getHighLights());
      verifyNoMoreInteractions(mockHighLightRepository);
    },
  );
}
