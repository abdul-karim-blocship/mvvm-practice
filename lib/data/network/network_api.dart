import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/exception/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResp({required String url}) async {
    final responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet');
    }
    return responseJson;
  }

  @override
  Future getPostApiResp({required String url, dynamic body}) async {
    final responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
       return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      case 404:
        throw BadRequestExceptions(response.body.toString());
      case 500:
        throw BadRequestExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error occured while communicating ${response.statusCode} ${response.body}');
    }
  }
}
