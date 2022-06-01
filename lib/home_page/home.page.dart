import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oyna/auth/firebase_user_provider.dart';
import 'package:oyna/day_page/day.page.dart';
import 'package:oyna/model/day.dart';
import 'package:oyna/profile_page/profile_page_widget.dart';

import '../auth/auth_util.dart';
import '../app/app_theme.dart';
import '../app/app_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        print('fdsfa');
      });
    });
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Container(
                              width: 46,
                              height: 46,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: currentUserPhoto != ''
                                  ? Image.network(
                                      currentUserPhoto,
                                    )
                                  : Image.asset(
                                      'assets/images/altynsaryn.png')),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Image.asset(
                            'assets/images/bbhcb_.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentUserDocument?.displayName ??
                                      'Нет имени',
                                  style:
                                      AppTheme.of(context).bodyText1.override(
                                            fontFamily: 'Poppins',
                                            color: AppTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Text(
                                        'Очки:',
                                        style: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: AppTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '${currentUserDocument?.points ?? 0}',
                                      style: AppTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: AppTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePageWidget(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/edit-3.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: days.length,
                  itemBuilder: (context, listViewIndex) {
                    Day listViewDayRecord = days[listViewIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DayPage(
                                  day: listViewDayRecord,
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/IMG_0024_11.png',
                            width: 130,
                            height: 130,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'День ' + listViewDayRecord.day.toString(),
                          style: AppTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: AppTheme.of(context).primaryColor,
                              ),
                        ),
                      ],
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
