import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:ravenfront/api/constants.dart';
import 'package:ravenfront/models/user.dart';

class UserService{
  Future<User> fetchUser() async {
    final response = await http
      .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint));

    if(response.statusCode == 200){
      print(response);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }
}