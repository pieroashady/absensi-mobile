import 'package:absensi_mobile/utils/app_utils.dart';

import '../api/main.dart';
import '../models/data/user_data.dart';

class UserService {
  static UserService? _instance;
  factory UserService() => _instance ??= UserService._();
  UserService._();

  Future<User> getCurrentUser() async {
    var token = AppUtils.getToken();
    Api().dio.options.headers = {'Authorization': 'Bearer $token'};
    final response = await Api().dio.get("/user");
    var loginResponse = User.fromJson(response.data);
    return loginResponse;
  }
}
