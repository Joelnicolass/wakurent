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

  // get user by id

  static getUser(String id) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";
      final token = await SecureStorage.getToken();

      // dio option send ath token
      dio.options.headers = {
        'auth': token,
      };
      response = await dio.get(
        'http://' + g.ip + ':5000/api/users/id/' + id,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future registerUser(String name, String surname, String address,
      String phone, String email, String password) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";
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
        print('status 200 user registrado con exito');
      }
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // add newFriend

  static Future addFriend(String userId, String name, String surname,
      String address, String password, String email, String phone) async {
    try {
      Response response;

      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";
      final token = await SecureStorage.getToken();

      // dio option send ath token
      dio.options.headers = {
        'auth': token,
      };
      response = await dio.put(
        'http://' + g.ip + ':5000/api/users/friends/' + userId + '/add',
        data: {
          "name": name,
          "surname": surname,
          "address": address,
          "email": email,
          "phone": phone,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        print('status 200 - invitado creado y añadido a lista de amigos');
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // TODO  ---> ADD QUICKFRIEND (QR id)

}
