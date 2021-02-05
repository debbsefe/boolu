import 'dart:async';
import 'dart:io';
import 'package:Boolu/Models/fetchMatches.dart';
import 'package:Boolu/Services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'matches_state.dart';
import 'matches_event.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final ApiService _apiService;

  FetchMatches fetchMatches;

  MatchesBloc(this._apiService) : super(MatchesInitial());

  @override
  Stream<MatchesState> mapEventToState(
    MatchesEvent event,
  ) async* {
    if (event is GetMatches) {
      yield MatchesLoading();
      try {
        fetchMatches = await _apiService.fetchMatches(
            event.competionId, event.season, event.dateFrom, event.dateTo);
        yield MatchesLoaded(fetchMatches);
      } on SocketException{
        yield MatchesError(
          error: NoInternetException('No Internet'),
        );
      } on HttpException {
        yield MatchesError(
          error: NoServiceFoundException('No Service Found'),
        );
      } on FormatException {
        yield MatchesError(
          error: InvalidFormatException('Invalid Response format'),
        );
      } catch (e) {
        yield MatchesError(
          error: UnknownException('Unknown Error'),
        );
      }
    }
  }
}

class NoInternetException {
  String message;
  NoInternetException(this.message);
}

class NoServiceFoundException {
  String message;
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  String message;
  InvalidFormatException(this.message);
}

class UnknownException {
  String message;
  UnknownException(this.message);
}
