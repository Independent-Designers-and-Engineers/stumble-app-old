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