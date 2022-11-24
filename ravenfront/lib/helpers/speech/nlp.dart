import 'package:ravenfront/helpers/speech/intents.dart';
import 'package:ravenfront/helpers/speech/utils.dart';

class Language{
  static const greetings = ['hello', 'hi', 'greetings', 'how are you'];
  static const openBrowser = ['open', 'google', 'opera', 'search the internet', 'search the web'];
  static const phrases = [greetings, openBrowser];

  parseInput(String input){
    Utils utils = Utils(); // Creating an instance of the Utils class
    input = input.toLowerCase(); // Sanitizing the input
    Intent intent = Intent.none; // Initialisiing the intent enum

    for(var phrase in phrases){ // Creating a for loop
      for(var word in phrase){ // Another for loop
        if(input.contains(word)){
          switch (phrase){ // Checking the phrase for references to one of the set phrases
            case greetings: {
              intent = Intent.greeting;
            }
            break;

            case openBrowser: {
              intent = Intent.openBrowser;
            }
            break;

            default: {
              throw Exception('An error has occured');
            }
          }
        }
      }
    }
    utils.matchCommand(intent);
  }
}