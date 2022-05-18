import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['ru', 'kk'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String ruText = '',
    String kkText = '',
  }) =>
      [ruText, kkText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hlwzpjnh': {
      'ru': 'Привет и добро пожаловать!',
      'kk': '',
    },
    'xnxtdv14': {
      'ru':
          'Научись говорить, писать и понимать на казахском яызке играя в игры и проходя задания.',
      'kk': '',
    },
    'l1wekshk': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // SelectLanguagePage
  {
    'bjnx61x9': {
      'ru': 'Выберите язык',
      'kk': '',
    },
    '5ndc8y3u': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // RegistrationPage
  {
    'i5mgwizw': {
      'ru': 'Регистрация',
      'kk': '',
    },
    'gt8pmd7n': {
      'ru': 'Ваша почта',
      'kk': '',
    },
    'v147iidg': {
      'ru': 'Введите вашу почту',
      'kk': '',
    },
    '9pvf096r': {
      'ru': 'Пароль',
      'kk': '',
    },
    'cbrq3hsv': {
      'ru': 'Введите ваш пароль',
      'kk': '',
    },
    'nwawtkhp': {
      'ru': 'Повторите пароль',
      'kk': '',
    },
    'd5gv4hn2': {
      'ru': 'Повторите ваш пароль',
      'kk': '',
    },
    '94y9kxrr': {
      'ru': 'ИЛИ ВОЙДИТЕ ЧЕРЕЗ',
      'kk': '',
    },
    'bytcmwo3': {
      'ru':
          'Продолжая регистрацию, вы соглашаетесь на обработку персональных данных с правилами участия в системе OYNA в соответствии с политикой конфиденциальности',
      'kk': '',
    },
    'tbbhfvep': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // LoginPage
  {
    'vcngz8mw': {
      'ru': 'Вход',
      'kk': '',
    },
    'gu73g6ec': {
      'ru': 'Ваша почта',
      'kk': '',
    },
    'mh6q6z43': {
      'ru': 'Введите вашу почту',
      'kk': '',
    },
    '9w2wzr7f': {
      'ru': 'Пароль',
      'kk': '',
    },
    '4sfdfpnk': {
      'ru': 'Введите ваш пароль',
      'kk': '',
    },
    'of07a6wv': {
      'ru': 'ИЛИ ВОЙДИТЕ ЧЕРЕЗ',
      'kk': '',
    },
    'wqs3en2t': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // ProfilePage
  {
    '2bw0tn6z': {
      'ru': 'Пол',
      'kk': '',
    },
    '117oddez': {
      'ru': 'Возраст',
      'kk': '',
    },
    '16vwx9lf': {
      'ru': 'Цель',
      'kk': '',
    },
    'cr6woey8': {
      'ru': 'Your bio',
      'kk': '',
    },
  },
  // EditProfile
  {
    'm9dgsxpm': {
      'ru': 'Никнейм',
      'kk': '',
    },
    'j1icmog1': {
      'ru': 'Пол',
      'kk': '',
    },
    'c5isyybs': {
      'ru': 'Возраст',
      'kk': '',
    },
    'ja6sds65': {
      'ru': 'Цель',
      'kk': '',
    },
    'o8z1eniv': {
      'ru': 'Your bio',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
