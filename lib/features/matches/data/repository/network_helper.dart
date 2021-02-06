import 'dart:convert';
import 'dart:io';
import 'package:Boolu/core/error/exception.dart';
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
      return _returnResponse(response);
    } on SocketException {
      throw FetchNetworkException('No Internet connection detected');
    } on FormatException {
      throw InvalidFormatException('Invalid Response format');
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

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 201:
        return json.decode(response.body);
      case 400:
        throw BadRequestException('Bad request, please try again');
      case 404:
        throw NoServiceFoundException('Match not found');
      case 403:
        throw UnauthorisedException('You are not authorized to view this page');
      case 500:
        throw InternalServerException('Something went wrong, please try again');
      default:
        throw FetchNetworkException(
            'Error occured while communicating with Server');
    }
  }
}
