import 'dart:convert';

import 'package:boolu/model/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Api with ChangeNotifier {
  Api();
  List<Sport> _response = [];
  List<Sport> get response => _response;

  Future<List<Sport>> fetchJobs() async {
    final jobsListAPIUrl = 'https://www.scorebat.com/video-api/v1/';
    final response = await get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      // response.body.firstW
      List jsonResponse = json.decode(response.body);
      _response = jsonResponse.map((job) {
        new Sport.fromJson(job);
      }).toList();
      notifyListeners();
      return _response;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  it() {
    _response.forEach((spo) {
      notifyListeners();

      return spo.competition.name.contains('ENGLAND: Premier League');
    });
  }
}
