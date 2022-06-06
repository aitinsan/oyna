import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_util.dart';
import 'package:oyna/app/internationalization.dart';
import 'package:oyna/components/outlined_button_widget.dart';

class SelectLanguagePageWidget extends StatefulWidget {
  const SelectLanguagePageWidget({Key? key}) : super(key: key);

  @override
  _SelectLanguagePageWidgetState createState() =>
      _SelectLanguagePageWidgetState();
}

class _SelectLanguagePageWidgetState extends State<SelectLanguagePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).primaryBackground,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/ou_main.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 16),
                      child: Text(
                        AppLocalizations.of(context)!.getText(
                          'bjnx61x9' /* Выберите язык */,
                        ),
                        style: AppTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 8),
                      child: InkWell(
                        onTap: () async {
                          setAppLanguage(context, 'ru');
                        },
                        child: OutlinedButtonWidget(
                          text: 'Русский',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                      child: InkWell(
                        onTap: () async {
                          setAppLanguage(context, 'kk');
                        },
                        child: OutlinedButtonWidget(
                          text: 'Казахский',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
