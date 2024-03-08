import 'package:apibinding_project_steps/features/login_screen/data/data_source/login_data_source.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_response1.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../../../core/error_handaling/custom_exception.dart';
import '../../domain/login_use_case.dart';

abstract class LoginRepoAbstract {
  Future<Either<CustomException, LoginResponse1>> getLoginData(
      {required http.Client client, required LoginRequest1 requestBody});

// Future<Either<CustomException, RegistrationResponseModel>> getRegistrationData(
//     {required http.Client client, required RegistrationRequestModel requestBody});
}

class LoginRepositoryImp implements LoginRepoAbstract {
  final LoginDataClass _loginData = LoginDataClass();

  // @override
  // Future<Either<CustomException, RegistrationResponseModel>> getRegistrationData({required http.Client client, required RegistrationRequestModel requestBody}) async {
  //   return await _loginData.getRegistrationData(client: client, reqBody: requestBody);
  // }

  @override
  Future<Either<CustomException, LoginResponse1>> getLoginData(
      {required http.Client client, required LoginRequest1 requestBody}) async {
    return await _loginData.getLoginData(
        client: client, requestBody: requestBody);
  }
}
