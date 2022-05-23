import 'package:flutter/cupertino.dart';
import 'package:oyna/model/teaching_card.dart';

class OneOfFour {
  String type;
  String topic;
  List<TeachingCard> teachingCards;
  OneOfFour({
    @required this.topic,
    @required this.type,
    @required this.teachingCards,
  });
}
