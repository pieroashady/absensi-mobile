import 'dart:convert';

import 'package:absensi_mobile/models/request/login_request.dart';
import 'package:absensi_mobile/screens/home.dart';
import 'package:absensi_mobile/screens/sign_in.dart';
import 'package:absensi_mobile/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var loading = false.obs;
  var error = false.obs;
  var message = ''.obs;

  setErrorAndMessage(bool value, String errorMsg) {
    error.value = value;
    message.value = errorMsg;
  }

  Future<void> handleLogout() async {
    final box = GetStorage();

    await box.remove("user");
    await box.remove("token");
    await Get.deleteAll();
    Get.offAll(const SignIn());
  }

  Future<void> handleLogin(LoginRequest loginRequest) async {
    loading.value = true;
    try {
      print('trigger');
      var response = await AuthService().login(loginRequest);

      var user = jsonEncode(response.data);
      var accessToken = response.data!.token;

      print(accessToken);

      final box = GetStorage();
      await box.write('user', user);
      await box.write('token', accessToken);

      Get.off(const MyHomePage());
      loading.value = false;
    } catch (e) {
      loading.value = false;

      print(e);
      if (e is DioError) {
        if (e.response?.data != null) {
          setErrorAndMessage(true, e.response!.data['message']);
          return;
        }
        setErrorAndMessage(false, "");
        Get.snackbar("Gagal login", "Terjadi kesalahan pada server");
        return;
      }
      setErrorAndMessage(false, "");
      Get.snackbar("Gagal login", "Terjadi kesalahan pada server");
      return;
    }
  }
}
