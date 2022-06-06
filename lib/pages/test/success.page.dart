import 'package:flutter/material.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/app/app_theme.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key, required this.points}) : super(key: key);
  final points;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                points >= 0 ? 'Жарайсың!' : 'Мүмкін келесі жолы сәттілікке ие боларсыз?',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              points >= 0
                  ? Image.asset('assets/images/altynsaryn.png')
                  : Image.asset('assets/images/sad_ibirai.jpg', height: 150,width: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    points >= 0 ? '+' + points.toString() : points.toString(),
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
      ),
    );
  }
}
