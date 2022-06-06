
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/internationalization.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/components/outlined_button_widget.dart';

import '../login_page/login_page_widget.dart';
import '../registration_page/registration_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPageWidget extends StatefulWidget {
  const IntroPageWidget({Key? key}) : super(key: key);

  @override
  _IntroPageWidgetState createState() => _IntroPageWidgetState();
}

class _IntroPageWidgetState extends State<IntroPageWidget> {
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  fit: BoxFit.cover,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 8),
                    child: Text(
                      AppLocalizations.of(context)!.getText(
                        'hlwzpjnh' /* Привет и добро пожаловать! */,
                      ),
                      style: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: AppTheme.of(context)
                                .secondaryBackground,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.2,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                    child: Text(
                      AppLocalizations.of(context)!.getText(
                        'xnxtdv14' /* Научись говорить, писать и пон... */,
                      ),
                      style: AppTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: AppTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPageWidget(),
                          ),
                        );
                      },
                      child: FilledButtonWidget(
                        text: 'Регистрация',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppTheme.of(context).primaryBackground,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPageWidget(),
                          ),
                        );
                      },
                      child: OutlinedButtonWidget(
                        text: 'Вход',
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
