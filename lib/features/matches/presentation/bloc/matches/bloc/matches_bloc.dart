import 'dart:async';

import 'package:Boolu/features/matches/data/models/fetchMatchModel.dart';
import 'package:Boolu/features/matches/domain/repositories/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc() : super(MatchesInitial());
  ApiService _apiService = ApiService();

  FetchMatchesModel fetchMatchesModel;
  @override
  Stream<MatchesState> mapEventToState(
    MatchesEvent event,
  ) async* {
    if (event is GetMatches) {
      yield MatchesLoading();
      try {
        fetchMatchesModel = await _apiService.fetchMatches(
            event.competionId, event.dateFrom, event.dateTo);
        yield MatchesLoaded(fetchMatchesModel);
      } catch (e) {
        yield MatchesError(
          error: e,
        );
      }
    }
  }
}
