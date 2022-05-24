import 'package:flutter/cupertino.dart';
import 'package:oyna/model/grammar_card.dart';

class OneOfFour {
  String type;
  String topic;
  List<GrammarCard> teachingCards;
  OneOfFour({
    required this.topic,
    required this.type,
    required this.teachingCards,
  });
}
