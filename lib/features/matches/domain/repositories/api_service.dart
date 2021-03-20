import 'dart:convert';

import 'package:Boolu/core/utils/strings.dart';
import 'package:Boolu/features/matches/data/models/api_football_event_model.dart';
import 'package:Boolu/features/matches/data/models/fetchMatchModel.dart';
import 'package:Boolu/features/matches/data/repositories/network_helper.dart';
import 'package:Boolu/features/matches/data/repositories/remote_config.dart';

class ApiService {
  NetworkHandler _networkHandler = NetworkHandler();
  Config config = Config();

  ///fetch matches for a date
  Future<FetchMatchesModel> fetchMatches(
      String competionId, String dateFrom, String dateTo) async {
    String url =
        "/competitions/$competionId/matches?dateFrom=$dateFrom&dateTo=$dateTo";
    var _result =
        await _networkHandler.get(footballdataBaseUrl, url, footballdata);
    FetchMatchesModel fetchMatches = FetchMatchesModel.fromJson(_result);
    return fetchMatches;
  }

  Future<List<ApiFootballEventModel>> apiFootballGetEvents(
      String competionId, String dateFrom, String dateTo) async {
    String token = await config.fetchToken(apifootball);
    String url =
        "/?action=get_events&APIkey=$token&from=$dateFrom&to=$dateTo&league_id=149";
    var _result =
        await _networkHandler.getTokenInParams(apifootballBaseUrl, url);
    final parsed = json.decode(_result).cast<Map<String, dynamic>>();
    return parsed
        .map<ApiFootballEventModel>(
            (json) => ApiFootballEventModel.fromJson(json))
        .toList();
  }
}
