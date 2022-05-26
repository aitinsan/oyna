import 'package:flutter/material.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/test/grammar.page.dart';
import 'package:oyna/test/listening.page.dart';
import 'package:oyna/test/reading.page.dart';
import 'package:oyna/test/success.page.dart';
import 'package:oyna/test/writing.page.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

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
