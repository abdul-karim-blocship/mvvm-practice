import 'dart:convert';

import 'package:http/http.dart';
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api.dart';
import 'package:mvvm/res/Constants/AppUrls/app_urls.dart';

class AuthRepo {
  BaseApiService apiService = NetworkApiService();

  Future<Map<String, dynamic>> loginUser(dynamic data) async {
    try {
      dynamic resp = await apiService.getPostApiResp(url: AppUrls.loginUrl, body: data);
      return resp;
    } catch (e) {
      rethrow;
    }
  }

  Future signUpUser(dynamic data) async {
    try {
      dynamic resp = await apiService.getPostApiResp(url: AppUrls.registerUrl, body: data);
      return resp;
    } catch (e) {
      rethrow;
    }
  }
}
