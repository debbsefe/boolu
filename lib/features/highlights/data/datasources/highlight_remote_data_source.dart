import 'package:Boolu/core/error/exception.dart';
import 'package:Boolu/features/highlights/data/models/scorebat_highlight_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class HighLightRemoteDataSource {
  /// Calls the required endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ScorebatHighlightModel>> getAllHighLights();
}

class HighLightRemoteDataSourceImpl implements HighLightRemoteDataSource {
  final http.Client client;

  HighLightRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<ScorebatHighlightModel>> getAllHighLights() async {
    String url = "https://www.scorebat.com/video-api/v1/";

    return _getMatchFromUrl(url);
  }

  Future<List<ScorebatHighlightModel>> _getMatchFromUrl(String url) async {
    final response = await client.get(
      url,
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      List<ScorebatHighlightModel> model = parsed
          .map<ScorebatHighlightModel>(
              (json) => ScorebatHighlightModel.fromJson(json))
          .toList();

      return model;
    } else {
      throw ServerException();
    }
  }
}
