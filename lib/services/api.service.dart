import 'dart:io';
import 'dart:convert';
import 'package:frontend/variables.dart' as env;
import 'package:http/http.dart' as http;

enum LOGIN_STATUS {SUCCESS, MISSING_INFO, SERVER_ERROR}

class APIService  {

  static final Map<String, String> HEADERS = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.userAgentHeader: 'Flutter-App-2020'
  };

  static void updateToken(String token)
  {
    APIService.HEADERS[HttpHeaders.authorizationHeader] = token;
  }

  void logout()
  {
    APIService.HEADERS.remove(HttpHeaders.authorizationHeader);
  }

  Future<LOGIN_STATUS> login(dynamic loginInfo) async
  {
    return http.post(
      env.API_URL + "login",
      headers: HEADERS,
      body: jsonEncode(loginInfo)
    ).then((http.Response response) {
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200) {
        Map loginRes = jsonDecode(response.body);
        APIService.updateToken(loginRes['token']);
        return LOGIN_STATUS.SUCCESS;
      } else return LOGIN_STATUS.MISSING_INFO;
    });
  }

  Future<dynamic> createAccount(dynamic accountInfo) async
  {
    final res = await http.post(
      env.API_URL + "create",
      headers: HEADERS,
      body: jsonEncode(accountInfo)
    );
    print(res.statusCode);
    return jsonDecode(res.body);
  }

}