// User model

// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  User({
    required this.user,
  });

  UserClass user;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        user: UserClass.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
      };
}

class UserClass {
  UserClass({
    required this.id,
    required this.role,
    required this.name,
    required this.surname,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.statusDb,
    required this.ownerProductsId,
    required this.clientProductsId,
    required this.friendRentingId,
    required this.friendsId,
    required this.v,
  });

  String id;
  String role;
  String name;
  String surname;
  String address;
  String phone;
  String email;
  String password;
  bool statusDb;
  List<String> ownerProductsId;
  List<String> clientProductsId;
  List<String> friendRentingId;
  List<String> friendsId;

  int v;

  factory UserClass.fromJson(String str) => UserClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        role: json["role"],
        name: json["name"],
        surname: json["surname"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        statusDb: json["statusDB"],
        ownerProductsId:
            List<String>.from(json["owner_products_id"].map((x) => x)),
        clientProductsId:
            List<String>.from(json["client_products_id"].map((x) => x)),
        friendRentingId:
            List<String>.from(json["friend_renting_id"].map((x) => x)),
        friendsId: List<String>.from(json["friends_id"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "role": role,
        "name": name,
        "surname": surname,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
        "statusDB": statusDb,
        "owner_products_id": List<dynamic>.from(ownerProductsId.map((x) => x)),
        "client_products_id":
            List<dynamic>.from(clientProductsId.map((x) => x)),
        "friend_renting_id": List<dynamic>.from(friendRentingId.map((x) => x)),
        "friends_id": List<dynamic>.from(friendsId.map((x) => x)),
        "__v": v,
      };
}
