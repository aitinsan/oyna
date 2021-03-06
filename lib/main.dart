import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oyna/app/background_audio.controller.dart';
import 'package:oyna/pages/home_page/home.page.dart';
import 'package:oyna/pages/intro_page/intro_page_widget.dart';
import 'package:provider/provider.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'app/app_theme.dart';
import 'app/app_util.dart';
import 'app/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppTheme.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BackgroundAudio()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = AppTheme.themeMode;

  Stream<OynaFirebaseUser>? userStream;
  OynaFirebaseUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = oynaFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () {
        setState(() => displaySplashImage = false);
      },
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        AppTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    Provider.of<BackgroundAudio>(context).start();

    /// Create application
    return MaterialApp(
      title: 'Oyna',
      localizationsDelegates: [
        AppLocalizationsDelegate(),

        /// Used for translating text to kazakh or russian
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ru', ''),
        Locale('kk', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitCircle(
                  color: AppTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            )
          : currentUser!.loggedIn //check if user logged in
              ? HomePage()
              : IntroPageWidget(),
    );
  }
}
