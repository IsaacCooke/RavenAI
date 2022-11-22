import 'package:flutter/material.dart';
import 'package:ravenfront/helpers/speech/speech_helper.dart';
import 'package:ravenfront/helpers/speech/nlp.dart';
import 'package:ravenfront/api_demo.dart';

class Home extends StatefulWidget{
  const Home({ super.key });

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  Language nlp = Language();
  String text = 'Press the button and start speaking';
  bool isListening = false;
  
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(30).copyWith(bottom: 150),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
        onPressed: toggleRecording,
      ),
    );
  }

  Future toggleRecording() => SpeechHelper.toggleRecording(
    onResult: (text) => setState(() => this.text = text),
    onListening: (isListening){
      setState(() => this.isListening = isListening);

      if(!isListening){
        Future.delayed(Duration(seconds: 1), () {
          nlp.parseInput(text);
        });
      }
    },
  );
}