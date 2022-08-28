import 'package:absensi_mobile/models/data/mata_pelajaran_data.dart';

class MapelResponse {
  bool? success;
  List<MataPelajaranData>? data;
  String? message;

  MapelResponse({this.success, this.data, this.message});

  MapelResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <MataPelajaranData>[];
      json['data'].forEach((v) {
        data!.add(MataPelajaranData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
