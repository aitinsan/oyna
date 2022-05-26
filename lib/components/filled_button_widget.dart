import '../app/app_theme.dart';
import '../app/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FilledButtonWidget extends StatefulWidget {
  const FilledButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  _FilledButtonWidgetState createState() => _FilledButtonWidgetState();
}

class _FilledButtonWidgetState extends State<FilledButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child:  Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.text,
              style: AppTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
            ),
          
        ),
      ),
    );
  }
}
