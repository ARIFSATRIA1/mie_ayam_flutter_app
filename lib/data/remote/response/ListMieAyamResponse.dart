import 'dart:convert';

ListMieAyamResponse listMieAyamResponseFromJson(String str) => ListMieAyamResponse.fromJson(json.decode(str));
String listMieAyamResponseToJson(ListMieAyamResponse data) => json.encode(data.toJson());


class ListMieAyamResponse {
  ListMieAyamResponse({
      this.data, 
      this.pagination, 
      this.message,});

  ListMieAyamResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    message = json['message'];
  }
  Data? data;
  Pagination? pagination;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      this.totalRecords, 
      this.totalPages, 
      this.currentPages, 
      this.pageSize,});

  Pagination.fromJson(dynamic json) {
    totalRecords = json['totalRecords'];
    totalPages = json['totalPages'];
    currentPages = json['currentPages'];
    pageSize = json['pageSize'];
  }
  int? totalRecords;
  int? totalPages;
  int? currentPages;
  int? pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalRecords'] = totalRecords;
    map['totalPages'] = totalPages;
    map['currentPages'] = currentPages;
    map['pageSize'] = pageSize;
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.mieAyam,});

  Data.fromJson(dynamic json) {
    if (json['mieAyam'] != null) {
      mieAyam = [];
      json['mieAyam'].forEach((v) {
        mieAyam?.add(MieAyam.fromJson(v));
      });
    }
  }
  List<MieAyam>? mieAyam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (mieAyam != null) {
      map['mieAyam'] = mieAyam?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

MieAyam mieAyamFromJson(String str) => MieAyam.fromJson(json.decode(str));
String mieAyamToJson(MieAyam data) => json.encode(data.toJson());
class MieAyam {
  MieAyam({
      this.id, 
      this.nameplace, 
      this.adress, 
      this.city, 
      this.image, 
      this.lat, 
      this.lon,});

  MieAyam.fromJson(dynamic json) {
    id = json['id'];
    nameplace = json['nameplace'];
    adress = json['adress'];
    city = json['city'];
    image = json['image'];
    lat = json['lat'];
    lon = json['lon'];
  }
  late String? id;
  late String? nameplace;
  late String? adress;
  late String? city;
  late String? image;
  late String? lat;
  late String? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameplace'] = nameplace;
    map['adress'] = adress;
    map['city'] = city;
    map['image'] = image;
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }

}