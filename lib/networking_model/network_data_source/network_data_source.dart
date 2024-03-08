import 'package:apibinding_project_steps/features/login_screen/data/model/login_request1.dart';
import 'package:http/http.dart' as http;

abstract class NetworkDataSource {
  Future<http.Response> getLoginSource(
      {required LoginRequest1 requestBody, required http.Client httpClient});
}
