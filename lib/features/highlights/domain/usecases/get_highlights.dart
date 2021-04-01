import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/usecases/usecase.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:Boolu/features/highlights/domain/repositories/highlight_repositories.dart';
import 'package:dartz/dartz.dart';

class GetHighLights extends UseCase<List<HighLightModel>, NoParams> {
  final HighLightRepository repository;

  GetHighLights(this.repository);
  @override
  Future<Either<Failure, List<HighLightModel>>> call(NoParams params) async {
    return await repository.getHighLights();
  }
}
