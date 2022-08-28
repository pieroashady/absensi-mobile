import '../api/main.dart';
import '../models/response/rekap_absen_response.dart';
import '../utils/app_utils.dart';

class RekapAbsenSiswaService {
  static RekapAbsenSiswaService? _instance;
  factory RekapAbsenSiswaService() => _instance ??= RekapAbsenSiswaService._();
  RekapAbsenSiswaService._();

  Future<RekapAbsenResponse> find(var mataPelajaranId) async {
    var user = AppUtils.getUser();
    final response = await Api().dio.get("/rekap-absen-siswa",
        queryParameters: {
          "siswa_id": user.siswa!.id,
          "mata_pelajaran_id": mataPelajaranId
        });
    var absenSiswaResponse = RekapAbsenResponse.fromJson(response.data);
    return absenSiswaResponse;
  }
}
