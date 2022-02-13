import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  Uri url(String endpoint) {
    var baseUrl = dotenv.env['BASE_URL'];
    return Uri.parse("$baseUrl$endpoint");
  }
}
