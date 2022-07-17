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
}
