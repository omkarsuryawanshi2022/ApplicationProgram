import 'dart:convert';

import 'package:apibinding_project_steps/core/error_handaling/custom_exception.dart';
import 'package:apibinding_project_steps/core/error_handaling/error_constants.dart';
import 'package:apibinding_project_steps/core/error_handaling/error_response_model.dart';
import 'package:apibinding_project_steps/features/login_screen/domain/login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

Either<CustomException, http.Response> responseStatusCodeHandler(
    {required http.Response response}) {
  // debugPrint('Response is in Handler => ${response.body}');
  switch (response.statusCode) {
    case 200:
      {
        return Right(response);
      }
    case 400:
      {
        if (response.body != null) {
          var errorMessage = handleErrorResponseBody(response);
          return Left(CustomException(errorMessage));
        }
        return Left(CustomException(ErrorMessage.errorMsg400));
      }

    case 401:
      {
        return Left(CustomException(ErrorMessage.errorMsg401));
      }

    case 404:
      {
        return Left(CustomException(ErrorMessage.errorMsg404));
      }

    case 500:
      {
        if (response.body != null) {
          var errorMessage = handleErrorResponseBody(response);
          return Left(CustomException(errorMessage));
        }
        return Left(CustomException(response.body));
      }
    default:
      {
        return Left(CustomException(ErrorMessage.badRequestExceptionMsg));
      }
  }
}

String handleErrorResponseBody(http.Response response) {
  if (response.body.isNotEmpty) {
    Map<String, dynamic> _data = jsonDecode(response.body);
    var errorModel = ErrorResponseModel.fromJson(_data);
    return '${errorModel.meta?.message} ${errorModel.meta?.code}';
  }
  return '';
}
