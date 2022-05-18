import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedButtonWidget extends StatefulWidget {
  const OutlinedButtonWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  _OutlinedButtonWidgetState createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
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
        color: Colors.transparent,
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
        elevation: 2,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: 14,
      ),
    );
  }
}
