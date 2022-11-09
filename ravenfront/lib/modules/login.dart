import 'package:flutter/material.dart';

import 'package:ravenfront/api/user_api.dart';
import 'package:ravenfront/models/user.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}): super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: nameController,
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
                    print(nameController.text); //* DEBUG LINE
                    print(passwordController.text); //* DEBUG LINE
                    // validateForm(nameController.text, passwordController.text); //! Need to add validation here.
                  },
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}

abstract class Validator extends State{
  late Future<User> futureUser;

  void initState(){
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context){
    return(
      FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const Text('Did some stuff'); //! Need to put something on this line for the validation
          } else if(snapshot.hasError){
            return Text('${snapshot.error}'); //! Need to finish this line as well- notice that credentials are wrong?
          }

          return const CircularProgressIndicator(); // To the hatred of millions...
        },
      )
    );
  }
}

/// I listened to the live version of 'Bigger than Us' by White Lies while writing this file.