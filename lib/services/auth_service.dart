import 'package:absensi_mobile/models/request/login_request.dart';
import 'package:absensi_mobile/models/response/login_response.dart';

import '../api/main.dart';

class AuthService {
  static AuthService? _instance;
  factory AuthService() => _instance ??= AuthService._();
  AuthService._();

  Future<LoginResponse> login(LoginRequest login) async {
    var data = login.toJson();
    final response = await Api().dio.post("/login", data: data);
    var loginResponse = LoginResponse.fromJson(response.data);
    return loginResponse;
  }
}
