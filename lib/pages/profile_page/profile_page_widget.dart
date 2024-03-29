import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/app_util.dart';
import 'package:oyna/app/background_audio.controller.dart';
import 'package:oyna/app/internationalization.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/components/filled_button_widget.dart';
import 'package:oyna/components/logo_widget.dart';
import 'package:oyna/pages/edit_profile/edit_profile_widget.dart';
import 'package:provider/provider.dart';
import '../intro_page/intro_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? ageAddressController;
  TextEditingController? genderController;
  TextEditingController? descriptionController;

  @override
  void initState() {
    super.initState();

    ageAddressController = TextEditingController();
    genderController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      // currentUserDocument.
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ProfilePageWidget oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).primaryBackground,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
          child: Column(
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
                    LogoWidget(),
                    InkWell(
                      onTap: () async {
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IntroPageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.getText(
                          'v9nk140r' /* Выйти */,
                        ),
                        style: AppTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: AppTheme.of(context).alternate,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: AuthUserStreamWidget(
                      child: Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: currentUserPhoto != ''
                              ? CachedNetworkImage(
                                  imageUrl: currentUserPhoto,
                                  fit: BoxFit.fitWidth,
                                )
                              : Image.asset('assets/images/altynsaryn.png')),
                    ),
                  ),
                ),
              ],
            ),
            AuthUserStreamWidget(
              child: Text(
                valueOrDefault<String>(
                  currentUserDisplayName,
                  'Имя',
                ),
                style: AppTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: AppTheme.of(context).primaryBtnText,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: AuthUserStreamWidget(
                child: TextFormField(
                  controller: genderController,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: currentUserDocument?.gender,
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: AppTheme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF95A1AC),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppTheme.of(context).primaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: AppTheme.of(context).primaryBtnText,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: AuthUserStreamWidget(
                child: TextFormField(
                  controller: ageAddressController,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: currentUserDocument?.age.toString(),
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: AppTheme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF95A1AC),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppTheme.of(context).primaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: AppTheme.of(context).primaryBtnText,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: AuthUserStreamWidget(
                child: TextFormField(
                  controller: descriptionController,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: currentUserDocument?.description,
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: AppTheme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: AppLocalizations.of(context)!.getText(
                      'cr6woey8' /* Your bio */,
                    ),
                    hintStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF95A1AC),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.of(context).primaryColor!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppTheme.of(context).primaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: AppTheme.of(context).primaryBtnText,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  var provider = Provider.of<BackgroundAudio>(context,listen: false);
                  if (provider.playing)
                    provider.stop();
                  else
                    provider.start();
                },
                icon: Icon(
                  Icons.music_note_outlined,
                  color: AppTheme.of(context).primaryColor,
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileWidget(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: FilledButtonWidget(
                          text: 'Изменить',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
