// To parse this JSON data, do
//
//     final wakure = wakureFromMap(jsonString);

import 'dart:convert';

class Wakure {
  Wakure({
    required this.geolocation,
    required this.id,
    required this.wakureId,
    required this.name,
    required this.hasOwner,
    required this.availablesDays,
    required this.statusDb,
    required this.v,
  });

  Geolocation geolocation;
  String id;
  String wakureId;
  String name;
  bool hasOwner;
  List<int> availablesDays;
  bool statusDb;
  int v;

  factory Wakure.fromJson(String str) => Wakure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wakure.fromMap(Map<String, dynamic> json) => Wakure(
        geolocation: Geolocation.fromMap(json["geolocation"]),
        id: json["_id"],
        wakureId: json["id"],
        name: json["name"],
        hasOwner: json["hasOwner"],
        availablesDays: List<int>.from(json["availablesDays"].map((x) => x)),
        statusDb: json["statusDB"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "geolocation": geolocation.toMap(),
        "_id": id,
        "id": wakureId,
        "name": name,
        "hasOwner": hasOwner,
        "availablesDays": List<dynamic>.from(availablesDays.map((x) => x)),
        "statusDB": statusDb,
        "__v": v,
      };
}

class Geolocation {
  Geolocation({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Geolocation.fromJson(String str) =>
      Geolocation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geolocation.fromMap(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}
























// To parse this JSON data, do
//
//     final ticket = ticketFromMap(jsonString);

