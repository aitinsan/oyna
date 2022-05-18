import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledButtonWidget extends StatefulWidget {
  const FilledButtonWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  _FilledButtonWidgetState createState() => _FilledButtonWidgetState();
}

class _FilledButtonWidgetState extends State<FilledButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget.text,
      options: FFButtonOptions(
        width: double.infinity,
        height: 50,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
        elevation: 2,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: 14,
      ),
    );
  }
}
