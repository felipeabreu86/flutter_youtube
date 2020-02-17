import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> httpGet(String url) async {
    http.Response response = await http.get(url);
    return response;
  }
}
