import 'dart:convert';
import 'dart:io';
import 'package:frontend/services/requests.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/variables.dart' as env;


final String url =  " ";
class Profile {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final int phoneNum;

  Profile({this.firstName, this.lastName, this.dateOfBirth, this.phoneNum});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      phoneNum: json['phoneNumber']
    );
  }
}

Future<Profile> fetchProfileData(dynamic token) async {
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

Future<Profile> fetchProfileLogin(dynamic loginInfo) async {
  final response =
      await http.post(url, body: loginInfo);

  if(response.statusCode == 200) {
    writeToken(response.body);
  } else{
    throw Exception('Failed to load post');
  }
}


Future<Profile> fetchProfileCreateAccount(dynamic accountInfo) async {
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