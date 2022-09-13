// To parse this JSON data, do
//
//     final userRes = userResFromJson(jsonString);

import 'dart:convert';

import 'package:flutterlearn/https/response/resapiresponse/resdatum.dart';
import 'package:flutterlearn/https/response/resapiresponse/ressupport.dart';

UserRes userResFromJson(String str) => UserRes.fromJson(json.decode(str));

String userResToJson(UserRes data) => json.encode(data.toJson());

class UserRes {
  UserRes({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Datum> data;
  Support support;

  factory UserRes.fromJson(Map<String, dynamic> json) => UserRes(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}
