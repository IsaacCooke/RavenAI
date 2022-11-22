import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ravenfront/models/user.dart';
import 'package:ravenfront/api/user_service.dart';
import 'package:ravenfront/api/constants.dart';


class ApiDemo extends StatefulWidget{
  @override
  State<ApiDemo> createState() => _APIDemoState();
}

class _APIDemoState extends State<ApiDemo>{
  UserService userService = new UserService();
  late List<User>? _user = [];
  late Future<User> futureUser;
  Future<User>? _newFutureUser;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    futureUser = userService.fetchUser();
  }

  void _getData() async {
    _user = (await userService.getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      _newFutureUser = userService.createUser(User(
                        id: '',
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        address: const Address(
                          street: 'Nowhere',
                          town: 'Nowhere',
                          country: 'Nowhere',
                          houseNumber: 0,
                          houseName: 'Nowhere',
                          postCode: 'Nowhere',
                        )
                      ));
                    });
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
            Expanded(
            child: ListView.builder(
              itemCount: _user!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_user![index].id),
                              Text(_user![index].firstName),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
            )
          ],
        ),
      ),
    );
  }
}


/*
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


*/