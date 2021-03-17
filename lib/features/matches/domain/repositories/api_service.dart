import 'package:Boolu/core/utils/strings.dart';
import 'package:Boolu/features/matches/data/models/fetchMatchModel.dart';
import 'package:Boolu/features/matches/data/repository/network_helper.dart';

class ApiService {
  NetworkHandler _networkHandler = NetworkHandler();

  ///fetch matches for a date
  Future<FetchMatchesModel> fetchMatches(
      String competionId, String dateFrom, String dateTo) async {
    String url =
        "/competitions/$competionId/matches?dateFrom=$dateFrom&dateTo=$dateTo";
    var _result =
        await _networkHandler.get(footballDatabaseUrl, url, footballdata);
    FetchMatchesModel fetchMatches = FetchMatchesModel.fromJson(_result);
    return fetchMatches;
  }
}
