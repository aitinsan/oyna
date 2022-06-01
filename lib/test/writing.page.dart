import 'package:flutter/material.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/components/text_field_widget.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_widgets.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/test/success.page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key, required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    for (var task in oneOfFour.writingCard!.tasks) {
      controllers.add(TextEditingController());
    }
    super.initState();
  }

  int index = 0;
  OneOfFour get oneOfFour => widget.oneOfFour;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          widget.oneOfFour.type,
          style: AppTheme.of(context).title1.override(
                fontFamily: 'Outfit',
                color: AppTheme.of(context).secondaryBackground,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  oneOfFour.writingCard!.taskDescription,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 16),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: oneOfFour.writingCard?.tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              oneOfFour.writingCard!.tasks[index].question,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: controllers[index]),
                            )
                          ],
                        ),
                      );
                    }),
                // if (index == widget.oneOfFour.grammarCards.length - 1)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                      child: AppButtonWidget(
                        onPressed: () async {
                          int points = 0;
                          for (var i = 0;
                              i < oneOfFour.writingCard!.tasks.length;
                              i++) {
                            if (oneOfFour.writingCard!.tasks[i].answer ==
                                controllers[i].text) {
                              points++;
                            } else {
                              points--;
                            }
                          }
                          await currentUserReference!.update(
                              createUserRecordData(
                                  description: currentUserDocument?.description,
                                  age: currentUserDocument?.age,
                                  displayName: currentUserDocument?.displayName,
                                  gender: currentUserDocument?.gender,
                                  photoUrl: currentUserDocument?.photoUrl,
                                  points: currentUserDocument?.points != null
                                      ? currentUserDocument!.points! + points
                                      : points));
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessPage(
                                        points: points,
                                      )));
                        },
                        text: 'Получить награду',
                        options: AppButtonOptions(
                          width: 300,
                          height: 50,
                          color: Color(0xFF4B39EF),
                          textStyle: AppTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
