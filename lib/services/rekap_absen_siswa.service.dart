import '../api/main.dart';
import '../models/response/rekap_absen_response.dart';
import '../utils/app_utils.dart';

class RekapAbsenSiswaService {
  static RekapAbsenSiswaService? _instance;
  factory RekapAbsenSiswaService() => _instance ??= RekapAbsenSiswaService._();
  RekapAbsenSiswaService._();

  Future<RekapAbsenResponse> find() async {
    var user = AppUtils.getUser();
    final response = await Api().dio.get(
          "/rekap-absen-siswa?siswa_id=${user.siswa!.id}",
        );
    var absenSiswaResponse = RekapAbsenResponse.fromJson(response.data);
    return absenSiswaResponse;
  }
}
