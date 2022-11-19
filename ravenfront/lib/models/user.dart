import 'dart:convert';

List<User> userFromJson(String str) =>
  List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {  
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final Address address;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    password: json['password'],
    address: Address.fromJson(json['address']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'address': address.toJson(),
  };
}

class Address{
  final String street;
  final String town;
  final String country;
  final int houseNumber;
  final String houseName;
  final String postCode;

  const Address({
    required this.street,
    required this.town,
    required this.country,
    required this.houseNumber,
    required this.houseName,
    required this.postCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json['street'],
    town: json['town'],
    country: json['country'],
    houseNumber: json['houseNumber'],
    houseName: json['houseName'],
    postCode: json['postCode'],
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'town': town,
    'country': country,
    'houseNumber': houseNumber,
    'houseName': houseName,
    'postCode': postCode,
  };
}