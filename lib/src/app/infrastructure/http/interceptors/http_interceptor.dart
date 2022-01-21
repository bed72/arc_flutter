import 'package:http/http.dart';

class HttpInterceptor extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll({
      'accept': 'application/json',
      'content-type': 'application/json',
    });

    return request.send();
  }
}
