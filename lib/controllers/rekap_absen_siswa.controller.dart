import 'package:get/get.dart';

import '../models/response/rekap_absen_response.dart';
import '../services/rekap_absen_siswa.service.dart';

class RekapAbsenController extends GetxController {
  var rekap = RekapAbsenResponse().obs;
  var loading = false.obs;

  @override
  void onInit() {
    setRekapAbsen();
    super.onInit();
  }

  setLoading(value) {
    loading.value = value;
  }

  setRekapAbsen() async {
    setLoading(true);
    try {
      var response = await RekapAbsenSiswaService().find();
      rekap.value = response;
      rekap.refresh();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Get.snackbar('Error', 'Terjadi kesalahan pada server');
    }
  }

  RekapAbsenResponse getRekap() {
    return rekap.value;
  }
}
