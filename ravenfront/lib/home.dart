import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ravenfront/models/user.dart';
import 'package:ravenfront/api/user_service.dart';
import 'package:ravenfront/api/constants.dart';


class Home extends StatefulWidget{
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  late Future<User> futureUser;

  @override
  void initState(){
    super.initState();
    futureUser = fetchUser();
  }

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<User>(
            future: futureUser,
            builder: ((context, snapshot) {
            if(snapshot.hasData){
              return Text(snapshot.data!.id);
            } else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
          ),
        ),
      )
    );
  }
}

Future<User> fetchUser() async {
    final response = await http
      .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint));
    print(response);
    print(response.body);
    print(User.fromJson(jsonDecode(response.body)));
    if(response.statusCode == 200){
      print(response);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }