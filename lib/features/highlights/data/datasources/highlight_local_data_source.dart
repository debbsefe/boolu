import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/features/highlights/data/models/scorebat_highlight_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

abstract class HighLightLocalDataSource {
  /// Gets the cached [ScorebatHighlightModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<ScorebatHighlightModel>> getLastHighlight();

  Future<void> cacheHighlight(List<ScorebatHighlightModel> highlightToCache);
}

const CACHED_HIGHLIGHT = 'CACHED_HIGHLIGHT';

class HighLightLocalDataSourceImpl implements HighLightLocalDataSource {
  final SharedPreferences sharedPreferences;

  HighLightLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<ScorebatHighlightModel>> getLastHighlight() {
    final jsonString = sharedPreferences.getString(CACHED_HIGHLIGHT);
    if (jsonString != null) {
      final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
      return Future.value(parsed
          .map<ScorebatHighlightModel>(
              (json) => ScorebatHighlightModel.fromJson(json))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheHighlight(List<ScorebatHighlightModel> matchToCache) {
    return sharedPreferences.setString(
      CACHED_HIGHLIGHT,
      json.encode(List<dynamic>.from(matchToCache.map((x) => x.toJson()))),
    );
  }
}
