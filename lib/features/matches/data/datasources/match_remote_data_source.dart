import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/core/utils/strings.dart';
import 'package:Boolu/features/matches/data/models/api_football_event_model.dart';
import 'package:Boolu/features/matches/data/repositories/remote_config.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class MatchRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ApiFootballEventModel>> getLeagueMatches(
      String dateFrom, String dateTo);
}

class MatchRemoteDataSourceImpl implements MatchRemoteDataSource {
  final http.Client client;

  MatchRemoteDataSourceImpl({@required this.client});
  Config config = Config();
  String formater(String baseUrl, String url) {
    return baseUrl + url;
  }

  @override
  Future<List<ApiFootballEventModel>> getLeagueMatches(
      String dateFrom, String dateTo) async {
    String token = await config.fetchToken(apifootball);
    String url =
        "/?action=get_events&APIkey=$token&from=$dateFrom&to=$dateTo&league_id=149";
    String finalurl = formater(apifootballBaseUrl, url);

    return _getMatchFromUrl(finalurl);
  }

  Future<List<ApiFootballEventModel>> _getMatchFromUrl(String url) async {
    final response = await client.get(
      url,
    );
    var body = json.decode(response.body);
    var type = body.runtimeType.toString();
    if (response.statusCode == 200 && type == 'List<dynamic>') {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ApiFootballEventModel>(
              (json) => ApiFootballEventModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
