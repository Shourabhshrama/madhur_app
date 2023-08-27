import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  static Future<Response> getResponse(Uri uri,Map<String, dynamic> param) {
    return http.post(uri, body: param);
  }
}
