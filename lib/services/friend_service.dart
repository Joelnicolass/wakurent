import 'package:dio/dio.dart';
import '../globals.dart' as g;

class FriendService {
// get all user Friends

  static Future getFriends(String id) async {
    try {
      Response response;
      var dio = Dio();

      // final token = await SecureStorage.getToken();

      // // dio option send ath token
      // dio.options.headers = {
      //   'auth': token,
      // };

      response = await dio.get('http://' + g.ip + ':5000/api/users/friends/' + id + '/all');

      return response.data;
    } on Exception catch (e) {
      print(e);
    }
  }
}
