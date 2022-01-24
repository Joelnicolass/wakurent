import 'package:dio/dio.dart';
import '../globals.dart' as g;

class FriendService {
// get all user Friends

  static Future getFriends(String id) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio
          .get('http://' + g.ip + ':5000/api/users/friends/' + id + '/all');
      return response.data;
    } on Exception catch (e) {
      print(e);
    }
  }

// delete friend

  static Future deleteFriend(String friendId, String userId) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";

      response = await dio.delete(
          'http://' + g.ip + ':5000/api/users/friends/' + userId + '/delete',
          data: {
            'friend_id': friendId,
          });

      if (response.statusCode == 200) {
        print('status 200 friend deleted');
      }
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
