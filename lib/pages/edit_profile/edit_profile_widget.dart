import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart' show IterableNullableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oyna/app/app_icon_button.dart';
import 'package:oyna/app/app_theme.dart';
import 'package:oyna/app/internationalization.dart';
import 'package:oyna/app/upload_media.dart';
import 'package:oyna/auth/auth_util.dart';
import 'package:oyna/backend/firebase_storage/storage.dart';
import 'package:oyna/backend/schema/user_record.dart';
import 'package:oyna/components/filled_button_widget.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String uploadedFileUrl = '';
  TextEditingController? nameController;
  TextEditingController? genderController;
  TextEditingController? ageController;
  TextEditingController? descriptionController;
  bool hide = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SelectedMedia? selectedPhoto;

  @override
  void initState() {
    super.initState();
    ageController =
        TextEditingController(text: currentUserDocument?.age.toString());
    genderController = TextEditingController(text: currentUserDocument?.gender);
    nameController = TextEditingController(text: currentUserDisplayName);
    descriptionController =
        TextEditingController(text: currentUserDocument?.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  children: [
                    AppIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 50,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppTheme.of(context).primaryBtnText,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
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
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthUserStreamWidget(
                  child: InkWell(
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        final downloadUrls = (await Future.wait(
                                selectedMedia.map((m) async =>
                                    await uploadData(m.storagePath, m.bytes!))))
                            .whereNotNull()
                            .toList();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrls != null &&
                            downloadUrls.length == selectedMedia.length) {
                          setState(() => uploadedFileUrl = downloadUrls.first);
                          showUploadMessage(
                            context,
                            'Success!',
                          );
                        } else {
                          showUploadMessage(
                            context,
                            'Failed to upload media',
                          );
                          return;
                        }
                      }
                      setState(() {
                        selectedPhoto = selectedMedia!.first;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppTheme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.05, 0.1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: Container(
                                      width: 90,
                                      height: 90,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: selectedPhoto != null
                                          ? Image.memory(selectedPhoto!.bytes!)
                                          : currentUserPhoto != ''
                                              ? Image.network(
                                                  currentUserPhoto,
                                                  fit: BoxFit.fitWidth,
                                                )
                                              : Image.asset(
                                                  'assets/images/altynsaryn.png')),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: AppTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
              child: AuthUserStreamWidget(
                child: TextFormField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      'm9dgsxpm' /* Никнейм */,
                    ),
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
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: AuthUserStreamWidget(
                child: TextFormField(
                  controller: genderController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      'j1icmog1' /* Пол */,
                    ),
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
                  controller: ageController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      'c5isyybs' /* Возраст */,
                    ),
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
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getText(
                      'ja6sds65' /* Цель */,
                    ),
                    labelStyle: AppTheme.of(context).bodyText2.override(
                          fontFamily: 'Lexend Deca',
                          color: AppTheme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: AppLocalizations.of(context)!.getText(
                      'o8z1eniv' /* Your bio */,
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
            if (hide == false)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            hide = true;
                          });
                          final userUpdateData = createUserRecordData(
                            description: descriptionController!.text,
                            age: int.parse(ageController!.text),
                            displayName: nameController!.text,
                            gender: genderController!.text,
                            photoUrl: uploadedFileUrl,
                          );
                          await currentUserReference!.update(userUpdateData);

                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: FilledButtonWidget(
                          text: 'Изменить',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
