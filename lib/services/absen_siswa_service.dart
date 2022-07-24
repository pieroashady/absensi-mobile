import 'package:absensi_mobile/models/response/absen_siswa_response.dart';
import 'package:absensi_mobile/utils/app_utils.dart';

import '../api/main.dart';
import '../models/data/absen_siswa_data.dart';
import '../models/request/absen_siswa_request.dart';

class AbsenSiswaService {
  static AbsenSiswaService? _instance;
  factory AbsenSiswaService() => _instance ??= AbsenSiswaService._();
  AbsenSiswaService._();

  Future<AbsenSiswaData> create(AbsenSiswaRequest absenSiswa) async {
    var data = absenSiswa.toJson();
    final response = await Api().dio.post("/absen-siswa", data: data);
    var absenSiswaResponse = AbsenSiswaData.fromJson(response.data);
    return absenSiswaResponse;
  }

  Future<AbsenSiswaResponse> find() async {
    var user = AppUtils.getUser();
    final response = await Api().dio.get(
          "/absen-siswa?siswa_id=${user.siswa!.id}&sort=created_at,desc",
        );
    var absenSiswaResponse = AbsenSiswaResponse.fromJson(response.data);
    return absenSiswaResponse;
  }
}
