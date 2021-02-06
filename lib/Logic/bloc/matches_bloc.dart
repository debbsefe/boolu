import 'dart:async';
import 'package:Boolu/Models/fetchMatches.dart';
import 'package:Boolu/Services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'matches_state.dart';
import 'matches_event.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final ApiService _apiService;

  FetchMatchesModel fetchMatchesModel;

  MatchesBloc(this._apiService) : super(MatchesInitial());

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
