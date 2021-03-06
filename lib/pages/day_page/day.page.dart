import 'package:flutter/material.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_util.dart';
import 'package:oyna/model/day.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/pages/test/test.page.dart';

class DayPage extends StatefulWidget {
  const DayPage({
    Key? key,
    required this.day,
  }) : super(key: key);

  final Day day;

  @override
  _DayPageState createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        automaticallyImplyLeading: true,
        title: Text(
          valueOrDefault<String>(
            widget.day.day.toString() + ' день',
            '0',
          ),
          style: AppTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: ((context, index) => Image.asset(
                        'assets/images/Line.png',
                        height: 100,
                      )),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.day.oneOfFours.length,
                  itemBuilder: (context, index) {
                    OneOfFour listViewOneOfFourRecord =
                        widget.day.oneOfFours[index];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestPage(
                              oneOfFour: listViewOneOfFourRecord,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppTheme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                (index + 1).toString(),
                                style: AppTheme.of(context)
                                    .bodyText1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              listViewOneOfFourRecord.type,
                              style: AppTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: AppTheme.of(context)
                                        .secondaryBackground,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
