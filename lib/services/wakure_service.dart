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
}
