import 'dart:convert';
import 'package:boolu/model/api.dart';
import 'package:http/http.dart';

class Api {
  Future<List<Sport>> fetchSport() async {
    final jobsListAPIUrl = 'https://www.scorebat.com/video-api/v1/';
    final response = await get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Sport.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
