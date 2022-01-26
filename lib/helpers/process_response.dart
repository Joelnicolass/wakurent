import 'dart:convert';
import 'dart:io';

import 'package:walkiler/models/client.dart';
import 'package:walkiler/models/ticket.dart';
import 'package:walkiler/models/user.dart';
import 'package:walkiler/models/wakure.dart';

class ProcessResponse {
  // process json list

  static List<dynamic> processJsonList(String jsonDataList) {
    // process json data

    final res = json.decode(jsonDataList);
    final decodedData = res as List;

    return decodedData;
  }

  // return wakure from json list

  static List<Wakure> getWakureList(List<dynamic> jsonListWakure) {
    List<Wakure> wakureList = [];

    for (var e in jsonListWakure) {
      final encode = json.encode(e);
      final wakure = Wakure.fromJson(encode);
      wakureList.add(wakure);
    }

    return wakureList;
  }

  // return user (friend) from json list

  static List<UserClass> getFriendList(List<dynamic> jsonListFriend) {
    List<UserClass> friendList = [];

    for (var e in jsonListFriend) {
      final encode = json.encode(e);
      final friend = UserClass.fromJson(encode);
      friendList.add(friend);
    }

    return friendList;
  }

  // return ticket list from json list

  static List<Ticket> getTicketList(List<dynamic> jsonListTicket) {
    List<Ticket> ticketList = [];

    for (var e in jsonListTicket) {
      final encode = json.encode(e);
      final ticket = Ticket.fromJson(encode);
      ticketList.add(ticket);
    }

    /* final List<Ticket> tickets = list.map((ticket) {
                  ticket = ticket as Map<String, dynamic>;

                  var jsonData = json.encode(ticket);

                  return Ticket.fromJson(jsonData);
                }).toList(); */

    return ticketList;
  }

  // return client list from tickets

  static List<Client> getClientList(List<Ticket> tickets) {
    List<Client> clientList = [];

    for (var i = 0; i < tickets.length; i++) {
      Client client = tickets[i].client[i];
      clientList.add(client);
    }

    return clientList;
  }
}
