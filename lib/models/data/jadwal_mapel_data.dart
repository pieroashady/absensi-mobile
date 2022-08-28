import 'package:absensi_mobile/models/data/guru_data.dart';
import 'package:absensi_mobile/models/data/kelas_data.dart';
import 'package:absensi_mobile/models/data/mata_pelajaran_data.dart';

class JadwalMapelData {
  int? id;
  int? guruId;
  int? kelasId;
  int? mataPelajaranId;
  String? createdAt;
  String? updatedAt;
  Guru? guru;
  Kelas? kelas;
  MataPelajaranData? mataPelajaran;

  JadwalMapelData(
      {this.id,
      this.guruId,
      this.kelasId,
      this.mataPelajaranId,
      this.createdAt,
      this.updatedAt,
      this.guru,
      this.kelas,
      this.mataPelajaran});

  JadwalMapelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guruId = json['guru_id'];
    kelasId = json['kelas_id'];
    mataPelajaranId = json['mata_pelajaran_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    guru = json['guru'] != null ? Guru.fromJson(json['guru']) : null;
    kelas = json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null;
    mataPelajaran = json['mata_pelajaran'] != null
        ? MataPelajaranData.fromJson(json['mata_pelajaran'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guru_id'] = guruId;
    data['kelas_id'] = kelasId;
    data['mata_pelajaran_id'] = mataPelajaranId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (guru != null) {
      data['guru'] = guru!.toJson();
    }
    if (kelas != null) {
      data['kelas'] = kelas!.toJson();
    }
    if (mataPelajaran != null) {
      data['mata_pelajaran'] = mataPelajaran!.toJson();
    }
    return data;
  }
}
