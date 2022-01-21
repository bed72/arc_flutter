import 'package:http/http.dart';

import 'package:pokedex/src/app/data/services/http/http_service.dart';
import 'package:pokedex/src/app/infrastructure/http/interceptors/http_interceptor.dart';

class HttpServiceImpl implements HttpService {
  late final HttpInterceptor _http;

  HttpServiceImpl(
    this._http,
  );

  @override
  Future<Response> get({
    required String url,
    Map<String, String>? header,
  }) {
    return _http.get(Uri.parse(url), headers: header);
  }
}
