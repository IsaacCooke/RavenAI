import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{
  FlutterTts ftts = FlutterTts();

  void Say(String text) async {
    await ftts.setLanguage('en-GB');
    await ftts.setSpeechRate(1);
    await ftts.setVolume(1.0);
    await ftts.setPitch(1);

    await ftts.speak(text);
  }
}