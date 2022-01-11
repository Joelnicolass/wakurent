import 'package:dio/dio.dart';
import '../globals.dart' as g;

class AuthService {
  static Future login(String email, String password) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";

      response = await dio.post(
        'http://' + g.ip + ':5000/api/auth/signin',
        data: {
          "email": email,
          "password": password,
        },
      );

      // guardar token en el storage

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
