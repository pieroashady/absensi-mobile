class AbsenSiswaRequest {
  int? siswaId;
  String? code;
  String? tipe;

  AbsenSiswaRequest({this.siswaId, this.code, this.tipe});

  AbsenSiswaRequest.fromJson(Map<String, dynamic> json) {
    siswaId = json['siswa_id'];
    code = json['code'];
    tipe = json['tipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['siswa_id'] = siswaId;
    data['code'] = code;
    data['tipe'] = tipe;
    return data;
  }
}
