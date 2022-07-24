import 'kelas_data.dart';

class Siswa {
  int? id;
  int? userId;
  int? kelasId;
  String? nis;
  String? namaSiswa;
  String? phoneNumber;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? fotoSiswa;
  String? createdAt;
  String? updatedAt;
  Kelas? kelas;

  Siswa(
      {this.id,
      this.userId,
      this.kelasId,
      this.nis,
      this.namaSiswa,
      this.phoneNumber,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.fotoSiswa,
      this.createdAt,
      this.updatedAt,
      this.kelas});

  Siswa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    kelasId = json['kelas_id'];
    nis = json['nis'];
    namaSiswa = json['nama_siswa'];
    phoneNumber = json['phone_number'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    fotoSiswa = json['foto_siswa'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kelas = json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['kelas_id'] = kelasId;
    data['nis'] = nis;
    data['nama_siswa'] = namaSiswa;
    data['phone_number'] = phoneNumber;
    data['jenis_kelamin'] = jenisKelamin;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['foto_siswa'] = fotoSiswa;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (kelas != null) {
      data['kelas'] = kelas!.toJson();
    }
    return data;
  }
}
