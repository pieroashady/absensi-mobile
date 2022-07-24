import '../api/main.dart';
import '../models/data/user_data.dart';

class UserService {
  static UserService? _instance;
  factory UserService() => _instance ??= UserService._();
  UserService._();

  Future<User> getCurrentUser() async {
    final response = await Api().dio.get("/user");
    var loginResponse = User.fromJson(response.data);
    return loginResponse;
  }
}
