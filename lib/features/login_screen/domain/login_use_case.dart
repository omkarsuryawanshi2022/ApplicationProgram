import 'package:apibinding_project_steps/core/error_handaling/custom_exception.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_response1.dart';
import 'package:apibinding_project_steps/features/login_screen/data/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class LoginPageUseCase {
  final LoginRepositoryImp _repositoryImp = LoginRepositoryImp();

  Future<Either<CustomException, LoginResponse1>> getLoginNotifier(
      {required http.Client client, required LoginRequest1 requestBody}) async {
    return await _repositoryImp.getLoginData(
        client: client, requestBody: requestBody);
  }

// Future<Either<CustomException, RegistrationResponseModel>> getRegistrationNotifier(
//     {required http.Client client, required RegistrationRequestModel dBody}) async {
//   return await _repositoryImp.getRegistrationData(client: client, requestBody: dBody);
// }

// Future<Either<CustomException, SignupFinalResponse>> getFinalRegistrationNotifier(
//     {required http.Client client, required SignupRequestModel dBody}) async {
//   return await _repositoryImp.getFinalRegistrationData(client: client, requestBody: dBody);
// }
}




