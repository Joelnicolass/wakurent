import 'package:dio/dio.dart';
import '../globals.dart' as g;

class AuthService {
  static Future login(String email, String password) async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.post(
        'http://' + g.ip + '.com/api/auth/signin',
        data: {
          "email": email,
          "password": password,
        },
      );
      return response.data;
    } catch (e) {
    } on Exception catch (e) {
      print(e);
    }
  }
}
