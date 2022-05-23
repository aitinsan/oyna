import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/model/teaching_card.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key, @required this.oneOfFour}) : super(key: key);
  final OneOfFour oneOfFour;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          widget.oneOfFour.type,
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            '${index + 1}/${widget.oneOfFour.teachingCards.length} ',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                              widget.oneOfFour.teachingCards.length,
                          // width: MediaQuery.of(context).size.width * 0.96,
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
                          widget.oneOfFour.teachingCards[index].title,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                        child: Text(
                          widget.oneOfFour.teachingCards[index].text,
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (index + 1 <= widget.oneOfFour.teachingCards.length)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
                      child: FFButtonWidget(
                        onPressed: () {
                          setState(() {
                            index = index + 1;
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'hv500nfb' /* Дальше */,
                        ),
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
      ),
    );
  }
}
