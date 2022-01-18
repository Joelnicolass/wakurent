import 'package:dio/dio.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import '../globals.dart' as g;

class UserService {
  static Future saveUser(String name, String surname, String address,
      String phone, String email, String password) async {
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
        'http://' + g.ip + ':5000/api/auth/signup',
        data: {
          "name": name,
          "surname": surname,
          "address": address,
          "email": email,
          "password": password,
          "phone": phone,
        },
      );

      if (response.statusCode == 200) {
        print('status 200 user creado con exito');
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
