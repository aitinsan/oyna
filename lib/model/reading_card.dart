import 'package:flutter/widgets.dart';

class ReadingCard {
  String titleRu;
  String textRu;
  String titleKz;
  String textKz;
  String question;
  List<ReadingQuestion> readingQuestions;
  ReadingCard(
      {required this.titleRu,
      required this.textRu,
      required this.titleKz,
      required this.textKz,
      required this.question,
      required this.readingQuestions});
}

class ReadingQuestion {
  String question;
  String answer;
  ReadingQuestion({required this.question, required this.answer});

  static List<String> getQuestionList(List<ReadingQuestion> list) {
    List<String> questionList = [];
    for (var element in list) {
      if (element.question != '') {
        questionList.add(element.question);
      }
    }
    return questionList;
  }

  static List<String> getAnswerList(List<ReadingQuestion> list) {
    List<String> answersList = [];
    for (var element in list) {
      answersList.add(element.answer);
    }
    return answersList;
  }
}
