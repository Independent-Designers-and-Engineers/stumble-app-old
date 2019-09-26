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

Future<Profile> fetchProfile() async {
  final response =
      await http.get(url);

  if(response.statusCode == 200) {
    return Profile.fromJson((json.decode(response.body)));
  } else{
    throw Exception('Failed to load post');
  }
}