import 'package:dio/dio.dart';
import 'package:walkiler/helpers/secure_storage.dart';
import '../globals.dart' as g;

class BookingService {

  // get All Tickets (by owner - except archived)
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
  
      String ticketId, String userId, String status, ) async {
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

  // get available wakures

  static Future verifyAvailability(String userId, String dateFrom,
      String dateTo, String timeFrom, String TimeTo) async {
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
          'http://' + g.ip + ':5000/api/booking/' + userId + '/verify',
          data: {
            'dateFrom': dateFrom,
            'dateTo': dateTo,
            'timeFrom': timeFrom,
            'timeTo': TimeTo,
          });

      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // get available days

  static Future getAvailableDays(String userId, String wakureId) async {
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
        'http://' + g.ip + ':5000/api/booking/' + userId + '/getavailabledays',
        data: {
          'wakureId': wakureId,
        },
      );

      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }

  // update available days

  static Future updateAvailableDays(
      String userId, String wakureId, List<int> days) async {
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
        'http://' + g.ip + ':5000/api/booking/' + userId + '/availabledays',
        data: {
          'wakureId': wakureId,
          'days': days,
        },
      );

      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }
  // save available days

  static Future saveAvailableDays(
      String userId, String wakureId, List<int> days) async {
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
        'http://' + g.ip + ':5000/api/booking/' + userId + '/availabledays',
        data: {
          'wakureId': wakureId,
          'days': days,
        },
      );

      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }


  // get All Tickets Archived
  static Future getAllTicketsArchived(String id) async {
    try {
      Response response;
      var dio = Dio();
      dio.options.contentType = "application/json; charset=utf-8";
      final token = await SecureStorage.getToken();

      // dio option send auth token
      dio.options.headers = {
        'auth': token,
      };
      response = await dio.get(
        'http://' + g.ip + ':5000/api/booking/' + id + '/archived',
      );
      print('responde.data desde el service');
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
