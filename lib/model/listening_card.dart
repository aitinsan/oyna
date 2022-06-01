import 'package:flutter/widgets.dart';

class ListeningCard {
  String? video;
  String? audio;
  String textRu;
  String question;
  List<ListeningTest> test;
  ListeningCard({
    required this.textRu,
    this.video,
    this.audio,
    required this.question,
    required this.test,
  });
}

class ListeningTest {
  String text;
  bool isCorrect;
  ListeningTest({required this.text, required this.isCorrect});
}
