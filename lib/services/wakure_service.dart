import 'package:dio/dio.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import '../globals.dart' as g;

class WakureService {
// ------- request with dio -------- //

// get user Wakures

  static Future getWakures(String id) async {
    try {
      Response response;
      var dio = Dio();

      final token = await SecureStorage.getToken();

      // dio option send ath token
      dio.options.headers = {
        'auth': token,
      };

      response = await dio
          .get('http://' + g.ip + ':5000/api/users/' + id + '/wakures');

      return response.data;
    } on Exception catch (e) {
      print(e);
    }
  }

// add new Wakure

  static Future saveWakure(
      String id, String wakureName, String wakureCode) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";

      final token = await SecureStorage.getToken();

      // dio option send ath token
      dio.options.headers = {
        'auth': token,
      };

      response = await dio.post(
        'http://' + g.ip + ':5000/api/users/' + id + '/addwakure',
        data: {
          "id": wakureCode,
          "name": wakureName,
        },
      );

      if (response.statusCode == 200) {
        print('status 200 todo ok');
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

// delete wakure

  static Future deleteWakure(String id) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";

      final token = await SecureStorage.getToken();

      // dio option send ath token
      dio.options.headers = {
        'auth': token,
      };

      response = await dio.delete('http://' + g.ip + ':5000/api/wakure/' + id);

      if (response.statusCode == 200) {
        print('status 200 wakure deleted');
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
