import 'dart:math';

import 'package:ravenfront/helpers/speech/intents.dart';
import 'package:ravenfront/helpers/speech/replies.dart';
import 'package:ravenfront/helpers/tts.dart';

class Utils{
  final TextToSpeech textToSpeech = TextToSpeech();
  final _random = new Random();
  final replies = Replies();

  void matchCommand(Intent intent){
    switch(intent){
      case Intent.none: {
        fallbackResponse();
      }
      break;
      case Intent.greeting: {
        greeting();
      }
      break;
      case Intent.openBrowser: {
        openBrowser();
      }
      break;
      default: {
        throw Exception('Sorry, something went wrong...');
      }
    }
  }

  Future fallbackResponse() async {
    int selection = _random.nextInt(replies.fallbackResponses.length);
    textToSpeech.Say(replies.fallbackResponses[selection]);
    print(replies.fallbackResponses[selection]);
    print("Fallback function called");
  }

  Future greeting() async {
    int selection = _random.nextInt(replies.greetings.length);
    textToSpeech.Say(replies.greetings[selection]);
    print(replies.greetings[selection]);
    print("Greeting function called");
  }

  Future openBrowser() async {
    print("Browser opened");
  }

}