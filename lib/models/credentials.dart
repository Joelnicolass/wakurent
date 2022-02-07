// To parse this JSON data, do
//
//     final credentials = credentialsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Credentials {
  Credentials({
    required this.name,
    required this.token,
  });

  String name;
  String token;

  factory Credentials.fromJson(String str) =>
      Credentials.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Credentials.fromMap(Map<String, dynamic> json) => Credentials(
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "token": token,
      };
}
