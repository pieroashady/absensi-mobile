import 'package:absensi_mobile/models/request/absen_siswa_request.dart';
import 'package:absensi_mobile/screens/home.dart';
import 'package:absensi_mobile/services/absen_siswa_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AbsenSiswaController extends GetxController {
  Future<void> handleAbsen(AbsenSiswaRequest data) async {
    try {
      await AbsenSiswaService().create(data);
      Get.snackbar('Berhasil absen!',
          'Selamat, kamu telah berhasil absen hari ini, tetap semangat');
      Get.off(const MyHomePage());
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null) {
          Get.snackbar("Gagal Absen", e.response!.data['message'],
              duration: const Duration(seconds: 5));
          Get.off(const MyHomePage());
          return;
        }
        print(e);
        print('kokok');
        Get.snackbar("Maaf terjadi gangguan pada server", "Harap coba kembali",
            duration: const Duration(seconds: 5));
        Get.off(const MyHomePage());
        return;
      }
      print(e);
      print('kokok');
      Get.snackbar("Maaf terjadi gangguan pada server", "Harap coba kembali",
          duration: const Duration(seconds: 5));
      Get.off(const MyHomePage());
      return;
    }
  }
}
