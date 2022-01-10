import 'package:dio/dio.dart';
import '../globals.dart' as g;

class AuthService {
  static Future login(String email, String password) async {
    try {
      print(email + " " + password);

      Response response;
      var dio = Dio();

      response = await dio.post(
        'http://' + g.ip + ':5000/api/auth/signin',
        data: {
          "email": email,
          "password": password,
        },
      );
      final token = response.headers['auth'];

      // guardar token en el storage

      return response.data;
    } catch (e) {
    } on Exception catch (e) {
      print(e);
    }
  }
}
