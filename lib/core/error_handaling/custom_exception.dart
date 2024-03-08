

import 'package:apibinding_project_steps/core/error_handaling/error_constants.dart';
import 'package:equatable/equatable.dart';

class CustomException extends Equatable implements Exception {

  final String errorDisplayingMessage;
  const CustomException(this.errorDisplayingMessage);

  @override
  List<Object?> get props => [errorDisplayingMessage];

}


class BadRequestException extends CustomException {
  BadRequestException() : super(ErrorMessage.badRequestExceptionMsg);
}

class UnAuthorizedException extends CustomException{
  const UnAuthorizedException([message]) : super(message);
}

class NetworkErrorException extends CustomException{
  const NetworkErrorException(String networkErrorException) : super(networkErrorException);
}
class TimeOutException extends CustomException{
  const TimeOutException(String timeOutException) : super(timeOutException);
}

class LoginInputException extends CustomException{
  const LoginInputException(String loginInputException) : super(loginInputException);
}

class UnKnownException extends CustomException{
  const UnKnownException(String unKnownException) : super(unKnownException);
}

