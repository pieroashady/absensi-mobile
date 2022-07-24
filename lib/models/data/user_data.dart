import 'package:absensi_mobile/models/data/siswa_data.dart';

class User {
  int? id;
  String? username;
  String? imeiDevice;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? token;
  Siswa? siswa;

  User(
      {this.id,
      this.username,
      this.imeiDevice,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.siswa});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    imeiDevice = json['imei_device'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    siswa = json['siswa'] != null ? Siswa.fromJson(json['siswa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['imei_device'] = imeiDevice;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    if (siswa != null) {
      data['siswa'] = siswa!.toJson();
    }
    return data;
  }
}
