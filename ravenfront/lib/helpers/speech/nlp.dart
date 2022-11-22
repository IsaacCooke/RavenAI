import 'package:ravenfront/helpers/speech/intents.dart';
import 'package:ravenfront/helpers/speech/utils.dart';

class Language{
  static const greetings = ['hello', 'hi', 'greetings', 'how are you'];
  static const openBrowser = ['open', 'google', 'opera', 'search the internet', 'search the web'];
  static const phrases = [greetings, openBrowser];

  parseInput(String input){
    Utils utils = Utils();
    input = input.toLowerCase();
    Intent intent = Intent.none;

    for(var phrase in phrases){
      for(var word in phrase){
        if(input.contains(word)){
          switch (phrase){
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