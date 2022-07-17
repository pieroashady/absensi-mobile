class AbsenSiswaData {
  int? id;
  int? siswaId;
  String? tanggal;
  String? jamMasuk;
  String? jamKeluar;
  String? keterangan;
  String? createdAt;
  String? updatedAt;

  AbsenSiswaData(
      {this.id,
      this.siswaId,
      this.tanggal,
      this.jamMasuk,
      this.jamKeluar,
      this.keterangan,
      this.createdAt,
      this.updatedAt});

  AbsenSiswaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siswaId = json['siswa_id'];
    tanggal = json['tanggal'];
    jamMasuk = json['jam_masuk'];
    jamKeluar = json['jam_keluar'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['siswa_id'] = siswaId;
    data['tanggal'] = tanggal;
    data['jam_masuk'] = jamMasuk;
    data['jam_keluar'] = jamKeluar;
    data['keterangan'] = keterangan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
