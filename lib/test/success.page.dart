import 'package:flutter/material.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/flutter_flow/flutter_flow_theme.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Жарайсың!',
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
            Image.asset('assets/images/altynsaryn.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+1',
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButtonWidget(text: 'Продолжить обучение'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
