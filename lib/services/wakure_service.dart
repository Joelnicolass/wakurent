import 'package:dio/dio.dart';
import '../globals.dart' as g;

class WakureService {
// get request with dio

  static Future getWakures(String id) async {
    try {
      Response response;
      var dio = Dio();

      response = await dio
          .get('http://' + g.ip + ':5000/api/users/' + id + '/wakures');

      return response.data;
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future saveWakure(String wakureName, String wakureCode) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";

      response = await dio.post(
        'http://' + g.ip + ':5000/api/wakure/new',
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
}