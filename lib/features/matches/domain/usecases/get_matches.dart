import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/usecases/usecase.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:Boolu/features/matches/domain/repositories/match_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetLeagueMatches extends UseCase<List<MatchesModel>, Params> {
  final MatchRepository repository;

  GetLeagueMatches(this.repository);
  @override
  Future<Either<Failure, List<MatchesModel>>> call(Params params) async {
    return await repository.getMatches(params.dateFrom, params.dateTo);
  }
}

class Params extends Equatable {
  final String competionId, dateFrom, dateTo;

  Params({this.competionId, @required this.dateFrom, @required this.dateTo});

  @override
  List<Object> get props => [competionId, dateFrom, dateTo];
}
