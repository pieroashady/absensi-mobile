import 'package:absensi_mobile/utils/app_utils.dart';
import 'package:dio/dio.dart';

import '../utils/app_config.dart';
import 'api_interceptor.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var token = AppUtils.getToken();

    var dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}
