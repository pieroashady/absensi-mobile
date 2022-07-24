import 'dart:convert';

import 'package:absensi_mobile/models/data/user_data.dart';
import 'package:get_storage/get_storage.dart';

class AppUtils {
  static User getUser() {
    final box = GetStorage();
    var readUser = box.read('user');
    var user = User.fromJson(jsonDecode(readUser));
    return user;
  }

  static String getToken() {
    final box = GetStorage();
    var token = box.read('token');
    return token.toString();
  }
}
