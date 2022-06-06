import 'package:flutter/material.dart';
import 'package:oyna/app/app_icon_button.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/internationalization.dart';
import 'package:oyna/auth/email_auth.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/pages/chat_page/chat_page_widget.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;
  late bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: AppIconButton(
                        borderColor: Colors.transparent,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF0F1113),
                          size: 22,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        child: Text(
                          AppLocalizations.of(context)!.getText(
                            'vcngz8mw' /* Вход */,
                          ),
                          textAlign: TextAlign.center,
                          style: AppTheme.of(context).title1.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x4D101213),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: emailAddressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      'gu73g6ec' /* Ваша почта */,
                    ),
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: AppLocalizations.of(context)!.getText(
                      'mh6q6z43' /* Введите вашу почту */,
                    ),
                    hintStyle: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                  ),
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF0F1113),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x4D101213),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !passwordVisibility,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      '9w2wzr7f' /* Пароль */,
                    ),
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: AppLocalizations.of(context)!.getText(
                      '4sfdfpnk' /* Введите ваш пароль */,
                    ),
                    hintStyle: AppTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      child: Icon(
                        passwordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFF57636C),
                        size: 22,
                      ),
                    ),
                  ),
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF0F1113),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 20, 24, 24),
              child: InkWell(
                onTap: () async {
                  final user = await signInWithEmail(
                    context,
                    emailAddressController!.text,
                    passwordController!.text,
                  );
                  if (user == null) {
                    return;
                  }

                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                    (r) => false,
                  );
                },
                child: FilledButtonWidget(
                  text: 'Войти',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
