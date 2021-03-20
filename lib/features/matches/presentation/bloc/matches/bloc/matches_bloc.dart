import 'dart:async';

import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/features/matches/domain/entities/match_model.dart';
import 'package:Boolu/features/matches/domain/usecases/get_matches.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'matches_event.dart';
part 'matches_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc({this.getLeagueMatches}) : super(MatchesInitial());
  final GetLeagueMatches getLeagueMatches;
  @override
  Stream<MatchesState> mapEventToState(
    MatchesEvent event,
  ) async* {
    if (event is GetMatches) {
      yield MatchesLoading();

      final _failureOrSuccess = await getLeagueMatches(
          Params(dateFrom: event.dateFrom, dateTo: event.dateTo));
      yield* _eitherLoadedOrErrorState(_failureOrSuccess);
    }
  }

  Stream<MatchesState> _eitherLoadedOrErrorState(
    Either<Failure, List<MatchesModel>> failureOrSuccess,
  ) async* {
    yield failureOrSuccess.fold(
      (failure) => MatchesError(_mapFailureToMessage(failure)),
      (success) => MatchesLoaded(success),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
