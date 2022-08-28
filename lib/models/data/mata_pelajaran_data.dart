class MataPelajaranData {
  int? id;
  String? namaMapel;
  String? createdAt;
  String? updatedAt;

  MataPelajaranData({this.id, this.namaMapel, this.createdAt, this.updatedAt});

  MataPelajaranData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaMapel = json['nama_mapel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_mapel'] = namaMapel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
