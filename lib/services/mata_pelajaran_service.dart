import '../api/main.dart';
import '../models/response/mapel_response.dart';

class MataPelajaranService {
  static MataPelajaranService? _instance;
  factory MataPelajaranService() => _instance ??= MataPelajaranService._();
  MataPelajaranService._();

  Future<MapelResponse> find() async {
    final response = await Api().dio.get(
          "/mata-pelajaran",
        );
    var absenSiswaResponse = MapelResponse.fromJson(response.data);
    return absenSiswaResponse;
  }
}
