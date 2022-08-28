import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/request/absen_siswa_request.dart';
import '../models/response/absen_siswa_response.dart';
import '../screens/home.dart';
import '../services/absen_siswa_service.dart';
import '../utils/app_utils.dart';

class AbsenSiswaController extends GetxController {
  var absenSiswa = AbsenSiswaResponse().obs;
  var loading = false.obs;

  setLoading(value) {
    loading.value = value;
  }

  setAbsenSiswa() async {
    setLoading(true);
    try {
      AbsenSiswaResponse response = await AbsenSiswaService().find();
      absenSiswa.update((val) {
        val!.data = response.data;
      });
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Get.snackbar('Error', 'Terjadi kesalahan sistem, coba kembali nanti');
    }
  }

  Future<void> handleAbsen(String code, String type, int mapelId) async {
    var user = AppUtils.getUser();

    try {
      var request =
          AbsenSiswaRequest(siswaId: user.siswa!.id, code: code, tipe: type);
      await AbsenSiswaService().create(request);

      Get.snackbar('Berhasil', 'Berhasil absen $type');
      Get.off(const MyHomePage());
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null) {
          Get.snackbar("Gagal Absen", e.response!.data['message'],
              duration: const Duration(seconds: 5));
          Get.off(const MyHomePage());
          return;
        }
        Get.snackbar("Maaf terjadi gangguan pada server", "Harap coba kembali",
            duration: const Duration(seconds: 5));
        Get.off(const MyHomePage());
        return;
      }
      Get.snackbar("Maaf terjadi gangguan pada server", "Harap coba kembali",
          duration: const Duration(seconds: 5));
      Get.off(const MyHomePage());
      return;
    }
  }
}
