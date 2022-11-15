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
  Future<User>? _newFutureUser;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    UserService userService = new UserService();
    futureUser = userService.fetchUser();
  }

  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
              FutureBuilder<User>(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.airline_seat_recline_normal_sharp),
                    hintText: "Enter your first name",
                    labelText: "First Name",
                  ),
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: "Enter your last name",
                    labelText: "Last Name",
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your email address",
                    labelText: "Email Address",
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: "Enter your password",
                    labelText: "Password",
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      UserService userService = new UserService();
                      _newFutureUser = userService.createUser(User(
                        id: '',
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                    });
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}