import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:ravenfront/api/constants.dart';
import 'package:ravenfront/models/user.dart';

class UserService{
  Future<List<User>?> getUsers() async {
    print("Called List<User>");
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> _model = userModelFromJson(response.body);
        print("Data received");
        return _model;
      }
    } catch (e) {
      print(e);
      log(e.toString());
    }
  }
}