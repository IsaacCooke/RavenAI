import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ravenfront/api/user_api.dart';
import 'package:ravenfront/models/user.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}): super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idController = TextEditingController();
  late Future<User> futureUser;

  void initState(){
    super.initState();
    futureUser = fetchUser();
  }

  bool validateForm(String email, String password, String id){
    bool succeeded = false;
    FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          print("There is data");
          if(snapshot.data!.password == password){
            print("the password is correct");
            if(snapshot.data!.email == email){
              succeeded = true;
              return const Text("Worked");
            }
          }
        }
        print("No data found");
        succeeded = false;
        return const Text("Failed");
      }
    );
    return succeeded;
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: false,
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'id',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(emailController.text); //* DEBUG LINE
                    print(passwordController.text); //* DEBUG LINE
                    print(validateForm(emailController.text, passwordController.text, idController.text));
                  }
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //sign-up screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}


/// I listened to the live version of 'Bigger than Us' by White Lies while writing this file.