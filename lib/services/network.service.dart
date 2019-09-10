import 'package:http/http.dart';

class UserClient extends BaseClient {

  final Client _inner;
  final Map<String, String> _headers = {
    'Content-Type': 'application/json'
  };

  UserClient(this._inner);

  Future<StreamedResponse> send(BaseRequest request)
  {
    this._headers.forEach((key, value) => request.headers[key] = value);
    return this._inner.send(request);
  }

  updateToken(String token)
  {
    this._headers['authorization'] = 'Bearer ' + token;
  }
}