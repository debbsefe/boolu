import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:dartz/dartz.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<MatchesModel>>> getMatches(
      String dateFrom, String dateTo);
}
