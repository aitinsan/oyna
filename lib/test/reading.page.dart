import 'package:flutter/material.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/flutter_flow/flutter_flow_theme.dart';
import 'package:oyna/flutter_flow/flutter_flow_widgets.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/model/reading_card.dart';
import 'package:oyna/test/success.page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({Key? key, required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  bool isRead = true;
  List<Widget> answersDrages = [];
  List<String> currentAnswers = [];
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    answers = ReadingQuestion.getAnswerList(
        widget.oneOfFour.readingCard!.readingQuestions);
    for (var element in ReadingQuestion.getQuestionList(
        widget.oneOfFour.readingCard!.readingQuestions)) {
      currentAnswers.add('');
    }
  }

  void _createDragWigets() {
    answersDrages = [];
    for (var element in answers) {
      answersDrages.add(Draggable<String>(
        data: element,
        feedback: Container(
          width: 160,
          height: 60,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                element,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
        childWhenDragging: Container(),
        child: Container(
          width: 160,
          height: 60,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                element,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(currentAnswers);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          widget.oneOfFour.type,
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: isRead
          ? _buildIsRead(widget.oneOfFour)
          : _buildTask(widget.oneOfFour),
    );
  }

  Widget _buildIsRead(OneOfFour oneOfFour) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: FlutterFlowTheme.of(context).primaryColor!),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  oneOfFour.readingCard!.titleRu,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  oneOfFour.readingCard!.textRu,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: FlutterFlowTheme.of(context).primaryColor!,
                  ),
                ),
                Text(
                  oneOfFour.readingCard!.titleKz,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  oneOfFour.readingCard!.textKz,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isRead = false;
              });
            },
            child: FilledButtonWidget(text: 'Приступить к заданию'),
          )
        ],
      ),
    );
  }

  Widget _buildTask(OneOfFour oneOfFour) {
    _createDragWigets();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Задание',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              oneOfFour.readingCard!.question,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ReadingQuestion.getQuestionList(
                        oneOfFour.readingCard!.readingQuestions)
                    .length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          oneOfFour
                              .readingCard!.readingQuestions[index].question,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        DragTarget<String>(
                          onAccept: (data) {
                            setState(() {
                              if (currentAnswers[index] != '')
                                answers.add(currentAnswers[index]);
                              currentAnswers[index] = data;
                              answers.removeWhere((element) => element == data);
                            });
                          },
                          builder: (context, _, __) {
                            if (currentAnswers[index] == '')
                              return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor!,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: 200,
                                  ));
                            else {
                              return Container(
                                width: 160,
                                height: 60,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      currentAnswers[index],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          onWillAccept: (data) => true,
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3),
              itemBuilder: (context, index) {
                return answersDrages[index];
              },
            ),
            if (currentAnswers.where((element) => element == '').isEmpty)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!.update(createUserRecordData(
                            description: currentUserDocument?.description,
                            age: currentUserDocument?.age,
                            displayName: currentUserDocument?.displayName,
                            gender: currentUserDocument?.gender,
                            photoUrl: currentUserDocument?.photoUrl,
                            points: currentUserDocument?.points != null
                                ? currentUserDocument!.points! + 1
                                : 1));
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessPage()));
                      },
                      text: 'Получить награду',
                      options: FFButtonOptions(
                        width: 300,
                        height: 50,
                        color: Color(0xFF4B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
