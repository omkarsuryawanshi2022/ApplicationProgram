import 'dart:convert';
import 'dart:io';

import 'package:apibinding_project_steps/core/error_handaling/custom_exception.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:apibinding_project_steps/networking_model/api_base_model/base_url.dart';
import 'package:apibinding_project_steps/networking_model/network_data_source/network_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import '../api_base_model/uri_builder.dart';

class NetworkDataRepo implements NetworkDataSource {
  var uriBuilder = URIBuilder();



  /// Login

  @override
  Future<http.Response> getLoginSource({required LoginRequest1 requestBody,
    required http.Client httpClient}) async {
    try {
      var uri = uriBuilder.getLoginData();
      var data = '';
      var header = uriBuilder.getApiEndPointHeaderContentType();
      data = json.encode(requestBody);
      var response = await http.post(uri, body: data, headers: header);
      debugPrint('NetworkDataRepo  Login response: ${response.body}');
      return response;
    } on TimeOutException catch (e) {
      debugPrint('Timed out $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('ExceptionXXX $e');
      rethrow;
    }
  }
}




























