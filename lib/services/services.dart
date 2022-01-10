import 'package:dio/dio.dart';

class Http {
// get request with dio

  static Future getWakures(String id) async {
    Response response;
    var dio = Dio();

    response =
        await dio.get('http://192.168.0.46:5000/api/users/' + id + '/wakures');

    return response.data;
  }
}
