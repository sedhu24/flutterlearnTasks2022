import 'dart:convert';

List<Datum> datumFromJson(String str) =>
    List<Datum>.from(json.decode(str).map((x) => Datum.fromJson(x)));

String datumToJson(List<Datum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
