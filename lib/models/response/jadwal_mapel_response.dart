import 'package:absensi_mobile/models/data/jadwal_mapel_data.dart';

class JadwalMapelResponse {
  List<JadwalMapelData>? data;
  Links? links;
  Meta? meta;

  JadwalMapelResponse({this.data, this.links, this.meta});

  JadwalMapelResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JadwalMapelData>[];
      json['data'].forEach((v) {
        data!.add(JadwalMapelData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;

  Meta({this.currentPage, this.from, this.path, this.perPage, this.to});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    return data;
  }
}
