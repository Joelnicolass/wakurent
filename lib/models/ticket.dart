// To parse this JSON data, do
//
//     final ticket = ticketFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:walkiler/models/models.dart';

import 'client.dart';

class Ticket {
  Ticket({
    required this.id,
    required this.idOwner,
    required this.idClient,
    required this.idWakure,
    required this.price,
    required this.dateFrom,
    required this.dateTo,
    required this.timeFrom,
    required this.timeTo,
    required this.status,
    required this.v,
    required this.wakure,
    required this.client,
  });

  String id;
  String idOwner;
  String idClient;
  String idWakure;
  int price;
  DateTime dateFrom;
  DateTime dateTo;
  String timeFrom;
  String timeTo;
  String status;
  int v;
  List<Wakure> wakure;
  List<Client> client;

  factory Ticket.fromJson(String str) => Ticket.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
        id: json["_id"],
        idOwner: json["id_owner"],
        idClient: json["id_client"],
        idWakure: json["id_wakure"],
        price: json["price"],
        dateFrom: DateTime.parse(json["dateFrom"]),
        dateTo: DateTime.parse(json["dateTo"]),
        timeFrom: json["timeFrom"],
        timeTo: json["timeTo"],
        status: json["status"],
        v: json["__v"],
        wakure: List<Wakure>.from(json["wakure"].map((x) => Wakure.fromMap(x))),
        client: List<Client>.from(json["client"].map((x) => Client.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "id_owner": idOwner,
        "id_client": idClient,
        "id_wakure": idWakure,
        "price": price,
        "dateFrom":
            "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
        "dateTo":
            "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
        "timeFrom": timeFrom,
        "timeTo": timeTo,
        "status": status,
        "__v": v,
        "wakure": List<dynamic>.from(wakure.map((x) => x.toMap())),
        "client": List<dynamic>.from(client.map((x) => x.toMap())),
      };
}

