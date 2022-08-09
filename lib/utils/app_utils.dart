import 'dart:convert';
import 'dart:io';

import 'package:absensi_mobile/models/data/user_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
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

  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
    return "";
  }
}
