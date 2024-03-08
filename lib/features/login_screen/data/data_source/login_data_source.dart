import 'dart:convert';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_response1.dart';
import 'package:apibinding_project_steps/features/login_screen/domain/login_use_case.dart';
import 'package:apibinding_project_steps/networking_model/network_data_source/network_data_repo.dart';
import 'package:apibinding_project_steps/networking_model/network_data_source/response_statuscode_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error_handaling/custom_exception.dart';

abstract class LoginDataSource {
  Future<Either<CustomException, LoginResponse1>> getLoginData(
      {required http.Client client, required LoginRequest1 requestBody});


}

class LoginDataClass implements LoginDataSource {
  @override
  Future<Either<CustomException, LoginResponse1>> getLoginData(
      {required http.Client client, required LoginRequest1 requestBody}) async {
    try {
      var response = await NetworkDataRepo()
          .getLoginSource(httpClient: client, requestBody: requestBody);
      var responseResult = responseStatusCodeHandler(response: response);
      return responseResult.fold((l) {
        return Left('l' as CustomException);
      }, (r) {
        Map<String, dynamic>? logindata = json.decode(response.body);
        return Right(LoginResponse1.fromJson(logindata!));
      });
    } catch (e) {
      rethrow;
    }
  }


}
