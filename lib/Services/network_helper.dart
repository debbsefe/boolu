import 'dart:convert';
import 'package:http/http.dart' as http;
import 'remote_config.dart';

class NetworkHandler {
  Config config = Config();
  // get request
  Future get(String baseUrl, String url, String tokenKey) async {
    try {
      String token = await config.fetchToken(tokenKey);
      url = formater(baseUrl, url);
      Map<String, String> headers = {"X-Auth-Token": token};
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future getWithoutToken(String baseUrl, String url) async {
    url = formater(baseUrl, url);
    var response = await http.get(
      url,
      headers: {"content-type": "application/json"},
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String formater(String baseUrl, String url) {
    return baseUrl + url;
  }
}
