class Guru {
  int? id;
  String? userId;
  String? nip;
  String? namaGuru;
  String? phoneNumber;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? foto;
  String? createdAt;
  String? updatedAt;

  Guru(
      {this.id,
      this.userId,
      this.nip,
      this.namaGuru,
      this.phoneNumber,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.foto,
      this.createdAt,
      this.updatedAt});

  Guru.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nip = json['nip'];
    namaGuru = json['nama_guru'];
    phoneNumber = json['phone_number'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    foto = json['foto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['nip'] = nip;
    data['nama_guru'] = namaGuru;
    data['phone_number'] = phoneNumber;
    data['jenis_kelamin'] = jenisKelamin;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['foto'] = foto;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
