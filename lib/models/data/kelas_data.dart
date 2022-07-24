class Kelas {
  int? id;
  int? jurusanId;
  String? namaKelas;
  String? createdAt;
  String? updatedAt;

  Kelas(
      {this.id,
      this.jurusanId,
      this.namaKelas,
      this.createdAt,
      this.updatedAt});

  Kelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jurusanId = json['jurusan_id'];
    namaKelas = json['nama_kelas'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jurusan_id'] = jurusanId;
    data['nama_kelas'] = namaKelas;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
