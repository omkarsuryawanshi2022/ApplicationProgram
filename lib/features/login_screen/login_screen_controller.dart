//
// import 'package:apibinding_project_steps/core/local/constants.dart';
// import 'package:apibinding_project_steps/core/local/utility.dart';
// import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
// import 'package:apibinding_project_steps/features/login_screen/data/model/login_response1.dart';
// import 'package:apibinding_project_steps/features/login_screen/domain/login_use_case.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class LoginController with ChangeNotifier {
//   final BuildContext context;
//
//   LoginController(this.context);
//
//   var errorMessage = '';
//   bool _isWaitingDone = true;
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   set isLoading(val) {
//     _isLoading = val;
//     notifyListeners();
//   }
//
//   late bool _showError = false;
//
//   bool get showError => _showError;
//
//   TextEditingController? usernameControllar = TextEditingController();
//   TextEditingController? passwordControllar = TextEditingController();
//
//   bool isShow = true;
//
//   LoginResponse1? _loginResponse = LoginResponse1();
//   final LoginPageUseCase _loginPageUseCase = LoginPageUseCase();
//
//   Future<void> onLoginSuccess(Context) async {
//     _isLoading = true;
//
//     _isWaitingDone = false;
//
//     notifyListeners();
//
//     if (await Utils.checkInternetConnectivity()) {
//       var username = usernameControllar!.text;
//       var password = passwordControllar!.text;
//       var loginfrom = 1;
//
//       var loginReqInput = LoginRequest1(
//           userName: username, password: password,loginfrom: loginfrom);
//       var client = http.Client();
//
//       var mLogin = await _loginPageUseCase.getLoginNotifier(
//           client: client, requestBody: loginReqInput);
//
//       client.close();
//       mLogin.fold((l) {
//         _isWaitingDone = true;
//         _showError = true;
//         errorMessage = l.errorDisplayingMessage;
//
//         notifyListeners();
//       }, (r) async {
//         _showError = false;
//         _loginResponse = r;
//         _isWaitingDone = true;
//
//         if (_loginResponse!.status == StatusCode.success) {
//           await onLoginSuccess(_loginResponse!.data!);
//
//         }
//         else {
//                 print('2 part');
//         }
//       });
//     } else {
//       print('3 part');
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
//
//


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apibinding_project_steps/core/local/constants.dart';
import 'package:apibinding_project_steps/core/local/utility.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:apibinding_project_steps/features/login_screen/data/model/login_response1.dart';
import 'package:apibinding_project_steps/features/login_screen/domain/login_use_case.dart';

class LoginController with ChangeNotifier {
  final BuildContext context;

  LoginController(this.context);

  var errorMessage = '';
  bool _isWaitingDone = true;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  late bool _showError = false;

  bool get showError => _showError;

  TextEditingController? usernameControllar = TextEditingController();
  TextEditingController? passwordControllar = TextEditingController();

  bool isShow = true;

  LoginResponse1? _loginResponse = LoginResponse1();
  final LoginPageUseCase _loginPageUseCase = LoginPageUseCase();

  Future<void> onLoginSuccess(Context) async {
    _isLoading = true;

    _isWaitingDone = false;

    notifyListeners();

    if (await Utils.checkInternetConnectivity()) {
      var username = usernameControllar!.text;
      var password = passwordControllar!.text;
      var loginfrom = 1;

      var loginReqInput = LoginRequest1(
          userName: username, password: password, loginfrom: loginfrom);
      var client = http.Client();

      var mLogin = await _loginPageUseCase.getLoginNotifier(
          client: client, requestBody: loginReqInput);

      client.close();
      mLogin.fold((l) {
        _isWaitingDone = true;
        _showError = true;
        errorMessage = l.errorDisplayingMessage;

        notifyListeners();
      }, (r) async {
        _showError = false;
        _loginResponse = r;
        _isWaitingDone = true;

        if (_loginResponse!.status == StatusCode.success) {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Successful'),
                content: Text('You have successfully logged in!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          print('2 part');
        }
      });
    } else {
      print('3 part');
    }
    isLoading = false;
    notifyListeners();
  }
}
