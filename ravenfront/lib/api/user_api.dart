import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ravenfront/models/user.dart';

Future<User> fetchUser() async {
  final response = await http
    .get(Uri.parse(baseUserUri));
  if(response.statusCode == 200){
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user data');
  }

  // TODO: Add origin point to CorsPolicy in Program.cs
}