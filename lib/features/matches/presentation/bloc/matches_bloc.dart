import 'dart:async';
import 'package:Boolu/features/matches/data/models/fetchMatchModel.dart';
import 'package:Boolu/features/matches/domain/repositories/api_service.dart';
import 'package:bloc/bloc.dart';
import 'matches_state.dart';
import 'matches_event.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  ApiService _apiService = ApiService();

  FetchMatchesModel fetchMatchesModel;

  MatchesBloc() : super(MatchesInitial());

  @override
  Stream<MatchesState> mapEventToState(
    MatchesEvent event,
  ) async* {
    if (event is GetMatches) {
      yield MatchesLoading();
      try {
        fetchMatchesModel = await _apiService.fetchMatches(
            event.competionId, event.season, event.dateFrom, event.dateTo);
        yield MatchesLoaded(fetchMatchesModel);
      } catch (e) {
        yield MatchesError(
          error: e,
        );
      }
    }
  }
}
