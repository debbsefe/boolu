import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/features/matches/data/models/api_football_event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class MatchLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<ApiFootballEventModel>> getLastMatch();

  Future<void> cacheMatch(List<ApiFootballEventModel> matchToCache);
}

const CACHED_MATCH = 'CACHED_MATCH';

class MatchLocalDataSourceImpl implements MatchLocalDataSource {
  final SharedPreferences sharedPreferences;

  MatchLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<ApiFootballEventModel>> getLastMatch() {
    final jsonString = sharedPreferences.getString(CACHED_MATCH);
    if (jsonString != null) {
      final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
      return Future.value(parsed
          .map<ApiFootballEventModel>(
              (json) => ApiFootballEventModel.fromJson(json))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheMatch(List<ApiFootballEventModel> matchToCache) {
    return sharedPreferences.setString(
      CACHED_MATCH,
      json.encode(List<dynamic>.from(matchToCache.map((x) => x.toJson()))),
    );
  }
}
