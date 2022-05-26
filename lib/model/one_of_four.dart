import 'package:flutter/cupertino.dart';
import 'package:oyna/model/grammar_card.dart';
import 'package:oyna/model/listening_card.dart';
import 'package:oyna/model/reading_card.dart';
import 'package:oyna/model/writing_card.dart';

class OneOfFour {
  String type;
  String topic;
  List<GrammarCard> grammarCards;
  ReadingCard? readingCard;
  ListeningCard? listeningCard;
  WritingCard? writingCard;
  OneOfFour({
    required this.topic,
    required this.type,
    this.grammarCards = const [],
    this.readingCard,
    this.listeningCard,
    this.writingCard,
  });
}
