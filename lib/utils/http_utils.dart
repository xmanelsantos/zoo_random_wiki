import 'package:http/http.dart' as http;

class HttpUtils {
  static Future<http.Response> get() async {
    const String apiUrl = 'https://zoo-animal-api.herokuapp.com/animals/rand';
    return http.get(Uri.parse(apiUrl));
  }
}
