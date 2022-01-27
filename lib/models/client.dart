import 'dart:convert';

class Client {
  Client({
    required this.name,
    required this.surname,
    required this.address,
    required this.phone,
    required this.email,
  });

  String name;
  String surname;
  String address;
  String phone;
  String email;

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        name: json["name"],
        surname: json["surname"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "surname": surname,
        "address": address,
        "phone": phone,
        "email": email,
      };
}
