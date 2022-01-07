// To parse this JSON data, do
//
//     final wakure = wakureFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Wakure {
  Wakure({
    required this.wakures,
  });

  List<WakureElement> wakures;

  factory Wakure.fromJson(String str) => Wakure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wakure.fromMap(Map<String, dynamic> json) => Wakure(
        wakures: List<WakureElement>.from(
            json["Wakures"].map((x) => WakureElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Wakures": List<dynamic>.from(wakures.map((x) => x.toMap())),
      };
}

class WakureElement {
  WakureElement({
    required this.id,
    required this.name,
    required this.geolocation,
    required this.booking,
  });

  int id;
  String name;
  Geolocation geolocation;
  bool booking;

  factory WakureElement.fromJson(String str) =>
      WakureElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WakureElement.fromMap(Map<String, dynamic> json) => WakureElement(
        id: json["id"],
        name: json["name"],
        geolocation: Geolocation.fromMap(json["geolocation"]),
        booking: json["booking"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "geolocation": geolocation.toMap(),
        "booking": booking,
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
