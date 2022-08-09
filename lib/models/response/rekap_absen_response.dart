class RekapAbsenResponse {
  bool? success;
  Data? data;
  String? message;

  RekapAbsenResponse({this.success, this.data, this.message});

  RekapAbsenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? totalAlpa;
  int? totalIzin;
  int? totalSakit;

  Data({this.totalAlpa, this.totalIzin, this.totalSakit});

  Data.fromJson(Map<String, dynamic> json) {
    totalAlpa = json['total_alpa'];
    totalIzin = json['total_izin'];
    totalSakit = json['total_sakit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_alpa'] = totalAlpa;
    data['total_izin'] = totalIzin;
    data['total_sakit'] = totalSakit;
    return data;
  }
}
