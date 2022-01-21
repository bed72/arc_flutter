import 'package:http/http.dart';

abstract class HttpService {
  Future<Response> get({
    required String url,
    Map<String, String>? header,
  });
}
