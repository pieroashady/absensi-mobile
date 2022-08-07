import 'package:absensi_mobile/models/data/user_data.dart';
import 'package:absensi_mobile/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = User().obs;
  var loading = false.obs;

  @override
  void onInit() {
    setUser();
    super.onInit();
  }

  setLoading(value) {
    loading.value = value;
  }

  setUser() async {
    print('trigger');
    setLoading(true);
    try {
      var response = await UserService().getCurrentUser();
      print(response.toJson());
      user.value = response;
      user.refresh();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Get.snackbar('Error', 'Terjadi kesalahan pada server');
    }
  }

  User getUser() {
    return user.value;
  }
}
