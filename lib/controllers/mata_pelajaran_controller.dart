import 'package:get/get.dart';

import '../models/response/mapel_response.dart';
import '../services/mata_pelajaran_service.dart';

class MataPelajaranController extends GetxController {
  var rekap = MapelResponse().obs;
  var loading = false.obs;

  @override
  void onInit() {
    setMataPelajaran();
    super.onInit();
  }

  setLoading(value) {
    loading.value = value;
  }

  setMataPelajaran() async {
    setLoading(true);
    try {
      var response = await MataPelajaranService().find();
      rekap.value = response;
      rekap.refresh();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Get.snackbar('Error', 'Terjadi kesalahan pada server');
    }
  }

  MapelResponse getMataPelajaran() {
    return rekap.value;
  }
}
