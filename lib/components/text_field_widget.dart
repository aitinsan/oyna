import 'package:flutter/material.dart';
import 'package:oyna/flutter_flow/flutter_flow_theme.dart';
import 'package:oyna/flutter_flow/flutter_flow_util.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key? key, required this.controller, this.isNum = false})
      : super(key: key);
  final TextEditingController? controller;
  final bool isNum;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: false,
      keyboardType: isNum ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: '-------',
        // labelText: 'Имя',
        labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
        hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryColor!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryColor!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).primaryBackground,
        // contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
      ),
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Lexend Deca',
            color: FlutterFlowTheme.of(context).primaryBtnText,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
    );
  }
}
