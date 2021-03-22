import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_cat_app/utils/errors.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() {
    return _apiService;
  }

  ApiService._internal();

  Future<dynamic> get(
      {@required String url, Map<String, String> headers}) async {
    var responseJson;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      responseJson = _checkResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> post(
      {@required String url, dynamic body, Map<String, String> headers}) async {
    bool isSuccessfull;
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      isSuccessfull = _checkResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return isSuccessfull;
  }

  //TODO Delete metodu düzenlenecek internetten status kodlarına bakıp

  Future<dynamic> delete(
      {@required String url, dynamic body, Map<String, String> headers}) async {
    var responseJson;
    try {
      http.Response response =
          await http.delete(Uri.parse(url), body: body, headers: headers);
      responseJson = _checkResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic _checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print("Data decoded: $responseJson");
        return responseJson;
      case 201:
        print("Post Succeed");
        return true;
        break;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenClienException(response.body.toString());
      case 500:
        throw InternalServerErrorException(response.body.toString());
      default:
        throw UnknownException(
            "Error occured while communication with server with statusCode: ${response.statusCode}. Response Body: ${response.body.toString()}");
    }
  }
}

/*


  Future<dynamic> apiTransaction(
      {@required ApiTransactionType type,
      @required url,
      Map<String, String> headers,
      dynamic body}) async {
    var decodedResponseJson;
    http.Response responseJson;

    try {
      switch (type) {
        case ApiTransactionType.GET:
          responseJson = await http.get(Uri.parse(url), headers: headers);

          break;
        case ApiTransactionType.POST:
          responseJson = await http.post(Uri.parse(url),
              headers: headers, body: jsonEncode(body));
          break;
        case ApiTransactionType.DELETE:
          responseJson =
              await http.delete(Uri.parse(url), headers: headers, body: body);
          break;
      }
      decodedResponseJson = _checkResponse(responseJson);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return decodedResponseJson;
  }

  enum ApiTransactionType { GET, POST, DELETE }
 */
