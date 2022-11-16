import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:ravenfront/api/constants.dart';
import 'package:ravenfront/models/user.dart';

class UserService{

  Future<List<User>?> getUsers() async {
    final response = await http
      .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint));
    if(response.statusCode == 200){
      List<User> _users = userFromJson(response.body);
      print(_users);
      return _users;
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> fetchUser() async {
    final response = await http
      .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + ApiConstants.exampleId));

    if(response.statusCode == 200){
      print(response);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }

  Future<User> createUser(User newUser) async {
    final response  = await http.post(
      Uri.parse(ApiConstants.baseUrl + "/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': newUser.firstName,
        'lastName': newUser.lastName,
        'email': newUser.email,
        'password': newUser.password,

      }),
    );
    if(response.statusCode == 201){
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }

  Future<User> deleteUser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse("${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("User not deleted");
    }
  }
}