import 'dart:io';

import 'package:apibinding_project_steps/core/error_handaling/error_constants.dart';
import 'package:apibinding_project_steps/features/login_screen/domain/login_use_case.dart';
import 'package:flutter/cupertino.dart';


import '../../core/error_handaling/custom_exception.dart';

CustomException responseErrorHandler(e) {
  if (e is SocketException) {
    debugPrint('resnponse Error handler ${e.toString()}');
    return NetworkErrorException(ErrorMessage.networkErrorExceptionMsg);
  }
  if (e is TimeOutException) {
    debugPrint('resnponse Error handler ${e.toString()}');
    return TimeOutException(ErrorMessage.timeOutExceptionMsg);
  }
  if (e is FormatException) {
    debugPrint('resnponse Error handler ${e.toString()}');
    return TimeOutException(ErrorMessage.formatExceptionMsg);
  }
  if (e is CustomException) {
    debugPrint('resnponse Error handler ${e.toString()}');
    return CustomException(ErrorMessage.formatExceptionMsg);
  }
  return UnKnownException(e.toString());
}
