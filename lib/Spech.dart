import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  stopSpeak() async {
    await flutterTts.stop();
  }
}
