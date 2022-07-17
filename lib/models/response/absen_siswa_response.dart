import '../data/absen_siswa_data.dart';

class AbsenSiswaResponse {
  List<AbsenSiswaData>? data;

  AbsenSiswaResponse({this.data});

  AbsenSiswaResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AbsenSiswaData>[];
      json['data'].forEach((v) {
        data!.add(AbsenSiswaData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
