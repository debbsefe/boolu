import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:dartz/dartz.dart';

abstract class HighLightRepository {
  Future<Either<Failure, List<HighLightModel>>> getHighLights();
}
