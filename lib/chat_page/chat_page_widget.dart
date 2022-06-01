import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/components/text_field_widget.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/home_page/home.page.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:uuid/uuid.dart';

enum Step {
  empty,
  texting,
  nickname,
  gender,
  age,
  goal,
  ready,
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: 'user');
  Step _step = Step.empty;
  TextEditingController? nameController;
  TextEditingController? ageController;
  final _bot = const types.User(
    id: 'bot',
    firstName: 'Ыбырай А.',
    imageUrl:
        'https://adebiportal.kz/images/w350-cct-si/upload/iblock/212/212544514e836a345e141cbbe7ffd70a.jpg',
  );

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: currentUserDisplayName);
    ageController =
        TextEditingController(text: currentUserDocument?.age.toString());
    _addBotMessage('Здравствуй, уважаемый путешественник!');
    _addBotMessage('Сегодня не часто встретишь путешественников');
    _addBotMessage('Возможно, ты один из тех храбрецов?');
    _addBotMessage(
        'Прошу прощения! Считаю невоспитанностью с моей стороны постоянно называть вас Путешественником. Как вас зовут?',
        afterStep: Step.nickname);

    _loadMessages();
  }

  void _addBotMessage(String message, {Step? afterStep}) {
    setState(() {
      _step = Step.texting;
    });

    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _messages.insert(
          0,
          types.TextMessage(
            id: const Uuid().v4(),
            author: _bot,
            text: message,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        if (afterStep != null) _step = afterStep;
      });
    });
  }

  void _addMessage(String message) {
    setState(() {
      _messages.insert(
        0,
        types.TextMessage(
          id: const Uuid().v4(),
          author: _user,
          text: message,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    });
  }

  Widget _bottomWidget() {
    switch (_step) {
      case Step.texting:
        return Row(
          children: [
            Text(
              'Ыбырай А печатает',
              style: TextStyle(color: Colors.white),
            ),
            JumpingText(
              '...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        );

      case Step.nickname:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                // flex: 3,
                child: TextFieldWidget(
                  controller: nameController,
                ),
              ),
              InkWell(
                onTap: () async {
                  await currentUserReference!.update(createUserRecordData(
                    description: currentUserDocument!.description,
                    age: currentUserDocument!.age,
                    displayName: nameController!.text,
                    gender: currentUserDocument!.gender,
                    photoUrl: currentUserDocument!.photoUrl,
                  ));
                  setState(() {
                    _addMessage(nameController!.text);
                    _addBotMessage(
                      'Ваше имя звучит красиво. Вы Господин или Госпожа? Введите ваш пол',
                      afterStep: Step.gender,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Icon(
                      Icons.send,
                      size: 30,
                      color: AppTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      case Step.gender:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await currentUserReference!.update(createUserRecordData(
                      description: currentUserDocument!.description,
                      age: currentUserDocument!.age,
                      displayName: currentUserDocument!.displayName,
                      gender: 'Господин',
                      photoUrl: currentUserDocument!.photoUrl,
                    ));
                    setState(() {
                      _addMessage('Господин');
                      _addBotMessage('Как прекрасно! Сколько вам лет ?',
                          afterStep: Step.age);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: FilledButtonWidget(text: 'Господин'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    await currentUserReference!.update(createUserRecordData(
                      description: currentUserDocument!.description,
                      age: currentUserDocument!.age,
                      displayName: currentUserDocument!.displayName,
                      gender: 'Госпожа',
                      photoUrl: currentUserDocument!.photoUrl,
                    ));
                    setState(() {
                      _addMessage('Госпожа');
                      _addBotMessage('Как прекрасно! Сколько вам лет ?',
                          afterStep: Step.age);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: FilledButtonWidget(text: 'Госпожа'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      case Step.age:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                // flex: 3,
                child: TextFieldWidget(
                  controller: ageController,
                  isNum: true,
                ),
              ),
              InkWell(
                onTap: () async {
                  await currentUserReference!.update(createUserRecordData(
                    description: currentUserDocument!.description,
                    age: int.parse(ageController!.text),
                    displayName: currentUserDocument!.displayName,
                    gender: currentUserDocument!.gender,
                    photoUrl: currentUserDocument!.photoUrl,
                  ));
                  setState(() {
                    _addBotMessage('И возраст у вас красивый!');
                    _addMessage(ageController!.text);
                    _addBotMessage(
                        'Прежде чем отправиться в путешествие я хочу узнать о цели вашего путешествия.',
                        afterStep: Step.goal);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Icon(
                      Icons.send,
                      size: 30,
                      color: AppTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      case Step.goal:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await currentUserReference!.update(createUserRecordData(
                    description: 'Я хочу полностью овладеть казахским языком.',
                    age: currentUserDocument!.age,
                    displayName: currentUserDocument!.displayName,
                    gender: currentUserDocument!.gender,
                    photoUrl: currentUserDocument!.photoUrl,
                  ));
                  setState(() {
                    _addMessage('Я хочу полностью овладеть казахским языком.');
                   _step= Step.empty;
                    Timer(Duration(milliseconds: 1500), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FilledButtonWidget(
                      text: 'Я хочу полностью овладеть казахским языком.'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () async {
                  await currentUserReference!.update(createUserRecordData(
                    description:
                        'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше.',
                    age: currentUserDocument!.age,
                    displayName: currentUserDocument!.displayName,
                    gender: currentUserDocument!.gender,
                    photoUrl: currentUserDocument!.photoUrl,
                  ));
                  setState(() {
                    _addMessage(
                        'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше.');
                    _step= Step.empty;
                    Timer(Duration(milliseconds: 1500), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: FilledButtonWidget(
                        text:
                            'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше.'),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () async {
                  await currentUserReference!.update(createUserRecordData(
                    description:
                        'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше',
                    age: currentUserDocument!.age,
                    displayName: currentUserDocument!.displayName,
                    gender: currentUserDocument!.gender,
                    photoUrl: currentUserDocument!.photoUrl,
                  ));
                  setState(() {
                    _addMessage(
                        'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше');
                    _step= Step.empty;
                    Timer(Duration(milliseconds: 1500), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: FilledButtonWidget(
                        text:
                            'Я уверен что знаю казахский в совершенстве, но хочу обогатить свой язык ещё больше'),
                  ),
                ),
              ),
            ],
          ),
        );

      case Step.empty:
        return SizedBox.shrink();

      default:
        return SizedBox.shrink();
    }
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_step);
    return Scaffold(
      backgroundColor: AppTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondaryBackground,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://adebiportal.kz/images/w350-cct-si/upload/iblock/212/212544514e836a345e141cbbe7ffd70a.jpg',
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Ыбырай Алтынсарин',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: AuthUserStreamWidget(
        child: Chat(
          theme: DarkChatTheme(),
          messages: _messages,
          // onMessageTap: _handleMessageTap,
          // onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: (p) {},
          showUserAvatars: true,
          user: _user,
          showUserNames: true,
          customBottomWidget: _bottomWidget(),
        ),
      ),
    );
  }
}
