import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:walkiler/helpers/secure_storage.dart';
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

      if (response.statusCode == 200) {
        final token = response.headers['auth']!.first;
        SecureStorage.saveToken(token);
        print('token guardado');
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
