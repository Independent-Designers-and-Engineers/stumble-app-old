import 'dart:convert';
import 'package:http/http.dart' as http;

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

Future<Profile> fetchProfileLogin(dynamic loginInfo) async {
  final response =
      await http.post(url, body: loginInfo);

  if(response.statusCode == 200) {
    return Profile.fromJson((json.decode(response.body)));
  } else{
    throw Exception('Failed to load post');
  }
}


Future<Profile> fetchProfileCreateAccount(dynamic accountInfo) async {
  final response =
  await http.post(url, body: accountInfo);

  if(response.statusCode == 200) {
    return Profile.fromJson((json.decode(response.body)));
  } else{
    throw Exception('Failed to load post');
  }
}