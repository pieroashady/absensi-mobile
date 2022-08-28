class AbsenSiswaRequest {
  int? siswaId;
  String? code;
  String? tipe;
  int? mataPelajaranId;

  AbsenSiswaRequest({this.siswaId, this.code, this.tipe, this.mataPelajaranId});

  AbsenSiswaRequest.fromJson(Map<String, dynamic> json) {
    siswaId = json['siswa_id'];
    code = json['code'];
    tipe = json['tipe'];
    mataPelajaranId = json['mata_pelajaran_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['siswa_id'] = siswaId;
    data['code'] = code;
    data['tipe'] = tipe;
    data['mata_pelajaran_id'] = mataPelajaranId;
    return data;
  }
}
