import 'package:flutter/material.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/pages/test/grammar.page.dart';
import 'package:oyna/pages/test/listening.page.dart';
import 'package:oyna/pages/test/reading.page.dart';
import 'package:oyna/pages/test/writing.page.dart';


class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    switch (widget.oneOfFour.type) {
      case 'Грамматика':
        return GrammarPage(oneOfFour: widget.oneOfFour);

      case 'Практика - Оқылым':
        return ReadingPage(oneOfFour: widget.oneOfFour);
      case 'Практика - Тыңдалым':
        return ListeningPage(oneOfFour: widget.oneOfFour);

      case 'Практика - Жазылым':
        return WritingPage(oneOfFour: widget.oneOfFour);
      default:
        Navigator.pop(context);
        return SizedBox.shrink();
    }
  }
}
