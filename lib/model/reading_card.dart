import 'package:flutter/widgets.dart';

/// [ReadingCard] used to represent reading tasks
class ReadingCard {
  String titleRu;
  String textRu;
  String titleKz;
  String textKz;
  String question;
  List<ReadingTest> readingTests;
  List<ReadingQuestion>? readingQuestions;
  ReadingCard(
      {required this.titleRu,
      required this.textRu,
      required this.titleKz,
      required this.textKz,
      required this.question,
      this.readingQuestions,
      this.readingTests = const []});
}

/// [ReadingQuestion] this is match test type
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

/// [ReadingTest] this is one choose test type
class ReadingTest {
  String question;
  List<ReadingTestOption> list;
  ReadingTest({required this.list, required this.question});
}

/// [ReadingTest] this is one choose test type
class ReadingTestOption {
  String text;
  bool isCorrect;
  ReadingTestOption({required this.text, required this.isCorrect});
}
