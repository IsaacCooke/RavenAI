import 'dart:convert';

List<User> userModelFromJson(String str) =>
  List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userModelToJson(List<User> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {  
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['userId'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
  };
}