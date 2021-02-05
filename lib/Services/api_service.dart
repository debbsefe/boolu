import 'package:Boolu/Models/fetchMatches.dart';
import 'package:Boolu/Utils/strings.dart';

import 'network_helper.dart';

class ApiService {
  NetworkHandler _networkHandler = NetworkHandler();

  ///fetch matches for a date
  Future<FetchMatches> fetchMatches(
      String competionId, String season, String dateFrom, String dateTo) async {
    String url =
        "/competitions/$competionId/matches?season=$season&dateFrom=$dateFrom&dateTo=$dateTo";
    var _result =
        await _networkHandler.get(footballDatabaseUrl, url, footballdata);
    FetchMatches fetchMatches = FetchMatches.fromJson(_result);
    return fetchMatches;
  }
}
