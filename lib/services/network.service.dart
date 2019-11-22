import 'dart:convert';
import 'dart:io';
import 'package:frontend/services/requests.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/variables.dart' as env;

final String API_URL = "https://stumble-server.herokuapp.com";
enum RequestCode {POST, FETCH_PROFILE, FETCH_LOGIN, FETCH_CREATE}
String _token = "";

class Profile {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String password;
  final int phoneNum;

  Profile({this.firstName, this.lastName, this.dateOfBirth, this.phoneNum,
    this.password});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      phoneNum: json['phoneNumber'],
      password: json['password']
    );
  }
}

Future<dynamic> request(String url, RequestCode requestCode,
    {String id, dynamic loginInfo, dynamic accountInfo, dynamic token}){
  String requestURL = API_URL + url;
  if(id != null){
    requestURL.replaceFirst(":Id", id);
  }
  switch(requestCode){
    case RequestCode.POST:
      return null;
      break;
    case RequestCode.FETCH_LOGIN:
      return fetchProfileLogin(url, loginInfo);
      break;
    case RequestCode.FETCH_CREATE:
      return fetchProfileCreateAccount(url, accountInfo);
      break;
    case RequestCode.FETCH_PROFILE:
      return fetchProfileData(url, token);
      break;
  }

  return null;
}

Future<Profile> fetchProfileData(String url, dynamic token) async {
  final response = await http.get(
      env.API_LINK,
      headers: {HttpHeaders.authorizationHeader: token}
  );

  if(response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(response.body);
    return Profile.fromJson(responseBody);
  } else{
    return null;
  }
}

Future<bool> fetchProfileLogin(String url, dynamic loginInfo) async {
  final response =
      await http.post(url, body: loginInfo);

  if(response.statusCode == 200) {
    writeToken(response.body);
    return true;
  } else{
    return false;
  }
}


Future<Profile> fetchProfileCreateAccount(String url, dynamic accountInfo) async {
  final response =
  await http.post(url, body: accountInfo);
  if(response.statusCode == 200) {
    Map<String, dynamic> responseBody = json.decode(response.body);
    String token = responseBody["session_token"];
    writeToken(token);
    return Profile.fromJson((json.decode(responseBody["profile"])));
  } else{
    throw Exception('Failed to load post');
  }
}