import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import '../globals.dart' as g;

class BookingService {
  static Future getAllTickets(String id) async {
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
        'http://' + g.ip + ':5000/api/booking/' + id + '/all',
      );

      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // add ticket

  static Future addTicket(
      String userId,
      String clientId,
      String wakureId,
      String price,
      String dateFrom,
      String dateTo,
      String timeFrom,
      String timeTo) async {
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
        'http://' + g.ip + ':5000/api/booking/' + userId + '/add',
        data: {
          'id_owner': userId,
          'id_client': clientId,
          'id_wakure': wakureId,
          'price': price,
          'dateFrom': dateFrom,
          'dateTo': dateTo,
          'timeFrom': timeFrom,
          'timeTo': timeTo,
        },
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // change status ticket

  static Future changeState(
      String userId, String status, String ticketId) async {
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
        'http://' + g.ip + ':5000/api/booking/' + userId + '/updatestatus',
        data: {
          'id_ticket': ticketId,
          'status': status,
        },
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
