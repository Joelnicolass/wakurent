import 'dart:convert';
import 'dart:io';

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
}
