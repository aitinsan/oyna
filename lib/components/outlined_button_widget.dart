import '../app/app_theme.dart';
import '../app/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OutlinedButtonWidget extends StatefulWidget {
  const OutlinedButtonWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _OutlinedButtonWidgetState createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.of(context).primaryColor!,
          width: 2,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.text!,
            style: AppTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: AppTheme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
