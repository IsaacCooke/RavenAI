import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ravenfront/api_demo.dart';

class Home extends StatefulWidget{
  const Home({ super.key });

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return const Text("Home Screen");
  }
}