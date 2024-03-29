import 'package:flutter/material.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_widgets.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/pages/test/success.page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GrammarPage extends StatefulWidget {
  const GrammarPage({Key? key, required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  State<GrammarPage> createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                          child: Text(
                            '${index + 1}/${widget.oneOfFour.grammarCards.length} ',
                            style: AppTheme.of(context).bodyText2.override(
                                  fontFamily: 'Outfit',
                                  color:
                                      AppTheme.of(context).secondaryBackground,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                        child: LinearPercentIndicator(
                          percent: (index + 1) /
                              widget.oneOfFour.grammarCards.length,
                          lineHeight: 12,
                          animation: true,
                          progressColor: Color(0xFF4B39EF),
                          backgroundColor: Color(0xFFE0E3E7),
                          barRadius: Radius.circular(24),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 100, 0, 0),
                        child: Text(
                          widget.oneOfFour.grammarCards[index].title,
                          style: AppTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color: AppTheme.of(context).secondaryBackground,
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                        child: Text(
                          widget.oneOfFour.grammarCards[index].text,
                          style: AppTheme.of(context).subtitle2.override(
                                fontFamily: 'Outfit',
                                color: AppTheme.of(context).secondaryBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (index + 1 <= widget.oneOfFour.grammarCards.length - 1)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                      child: AppButtonWidget(
                        onPressed: () {
                          setState(() {
                            index = index + 1;
                          });
                        },
                        text: 'Дальше',
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
              if (index == widget.oneOfFour.grammarCards.length - 1)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                      child: AppButtonWidget(
                        onPressed: () async {
                          await currentUserReference!.update(
                            createUserRecordData(
                                description: currentUserDocument?.description,
                                age: currentUserDocument?.age,
                                displayName: currentUserDocument?.displayName,
                                gender: currentUserDocument?.gender,
                                photoUrl: currentUserDocument?.photoUrl,
                                points: currentUserDocument?.points != null
                                    ? currentUserDocument!.points! + 0
                                    : 0),
                          );
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessPage(
                                points: 0,
                              ),
                            ),
                          );
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
    );
  }
}
