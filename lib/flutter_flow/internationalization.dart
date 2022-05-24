import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations? of(BuildContext context) =>
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
      [ruText, kkText][languageIndex];
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
  // IntroPage
  {
    'hlwzpjnh': {
      'ru': 'Привет и добро пожаловать!',
      'kk': 'Сәлем және қош келдіңіз!',
    },
    'xnxtdv14': {
      'ru':
          'Научись говорить, писать и понимать на казахском яызке играя в игры и проходя задания.',
      'kk':
          'Ойын ойнау, тапсырмаларды орындау арқылы қазақ тілінде сөйлеуге, жазуға, түсінуге үйрету.',
    },
    'l1wekshk': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // SelectLanguagePage
  {
    'bjnx61x9': {
      'ru': 'Выберите язык',
      'kk': 'Тілді таңдаңыз',
    },
    '5ndc8y3u': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // RegistrationPage
  {
    'i5mgwizw': {
      'ru': 'Регистрация',
      'kk': 'Тіркеу',
    },
    'gt8pmd7n': {
      'ru': 'Ваша почта',
      'kk': 'Сіздің поштаңыз',
    },
    'v147iidg': {
      'ru': 'Введите вашу почту',
      'kk': 'Электрондық поштаңызды енгізіңіз',
    },
    '9pvf096r': {
      'ru': 'Пароль',
      'kk': 'Құпия сөз',
    },
    'cbrq3hsv': {
      'ru': 'Введите ваш пароль',
      'kk': 'Құпия сөзіңізді енгізіңіз',
    },
    'nwawtkhp': {
      'ru': 'Повторите пароль',
      'kk': 'Құпия сөзді қайталаңыз',
    },
    'd5gv4hn2': {
      'ru': 'Повторите ваш пароль',
      'kk': 'Құпия сөзіңізді қайталаңыз',
    },
    '94y9kxrr': {
      'ru': 'ИЛИ ВОЙДИТЕ ЧЕРЕЗ',
      'kk': 'НЕМЕСЕ МЕНЕН КІРУ',
    },
    'bytcmwo3': {
      'ru':
          'Продолжая регистрацию, вы соглашаетесь на обработку персональных данных с правилами участия в системе OYNA в соответствии с политикой конфиденциальности',
      'kk':
          'Тіркеуді жалғастыра отырып, сіз құпиялылық саясатына сәйкес OYNA жүйесіне қатысу ережелерімен жеке деректерді өңдеуге келісесіз.',
    },
    'tbbhfvep': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // LoginPage
  {
    'vcngz8mw': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'gu73g6ec': {
      'ru': 'Ваша почта',
      'kk': 'Сіздің поштаңыз',
    },
    'mh6q6z43': {
      'ru': 'Введите вашу почту',
      'kk': 'Электрондық поштаңызды енгізіңіз',
    },
    '9w2wzr7f': {
      'ru': 'Пароль',
      'kk': 'Құпия сөз',
    },
    '4sfdfpnk': {
      'ru': 'Введите ваш пароль',
      'kk': 'Құпия сөзіңізді енгізіңіз',
    },
    'of07a6wv': {
      'ru': 'ИЛИ ВОЙДИТЕ ЧЕРЕЗ',
      'kk': 'НЕМЕСЕ МЕНЕН КІРУ',
    },
    'wqs3en2t': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // ProfilePage
  {
    '2bw0tn6z': {
      'ru': 'Пол',
      'kk': 'Еден',
    },
    '117oddez': {
      'ru': 'Возраст',
      'kk': 'Жасы',
    },
    '16vwx9lf': {
      'ru': 'Цель',
      'kk': 'Мақсат',
    },
    'cr6woey8': {
      'ru': 'Your bio',
      'kk': 'Сіздің өміріңіз',
    },
    'v9nk140r': {
      'ru': 'Выйти',
      'kk': 'Шығу',
    },
  },
  // EditProfile
  {
    'm9dgsxpm': {
      'ru': 'Никнейм',
      'kk': 'Лақап аты',
    },
    'j1icmog1': {
      'ru': 'Пол',
      'kk': 'Еден',
    },
    'c5isyybs': {
      'ru': 'Возраст',
      'kk': 'Жасы',
    },
    'ja6sds65': {
      'ru': 'Цель',
      'kk': 'Мақсат',
    },
    'o8z1eniv': {
      'ru': 'Your bio',
      'kk': 'Сіздің өміріңіз',
    },
  },
  // Test
  {
    'rdjvydeh': {
      'ru': '1/3',
      'kk': '1/3 сұрақ',
    },
    'kiwe27yi': {
      'ru': 'Антоним',
      'kk': 'Көңіл күйлеріңіз қалай?',
    },
    'irma189e': {
      'ru':
          'Мағыналары бір-біріне қарама-қарсы сөздер антонимдер деп аталады. \n\nМысалы, \nелгезек бала-тілазар бала, \nшабан ат-жүрдек ат,\n іскер адам-олақ адам, \nжақсы мінез-жаман мінез, \nқисық ағаш-түзу ағаш, \nтату көрші- араз көрші, т.б. \n\nТілімізде антоним сөздер мақал-мәтелдерде, жұмбақтарда көп кездеседі. \n',
      'kk': '1-3 шкала бойынша бүгін өзіңізді қалай сезінесіз?',
    },
    'hv500nfb': {
      'ru': 'Дальше',
      'kk': 'Келесі сұрақ',
    },
    'bquww988': {
      'ru': 'Грамматика',
      'kk': 'Күнделікті викторина',
    },
    'cc7czlwy': {
      'ru': 'Home',
      'kk': 'Үй',
    },
  },
  // HomePage
  {
    '0u3i2zcb': {
      'ru': 'Очки:',
      'kk': '',
    },
    'e7gg6xa6': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // DayPage
  {
    'lsg0npzg': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    'i538gtm9': {
      'ru': '',
      'kk': '',
    },
    '4cmc72q4': {
      'ru': '',
      'kk': '',
    },
    'iax5nxe3': {
      'ru': '',
      'kk': '',
    },
    'whvq5wwk': {
      'ru': '',
      'kk': '',
    },
    't18z2tru': {
      'ru': '',
      'kk': '',
    },
    '7pe9cpqy': {
      'ru': '',
      'kk': '',
    },
    'qi6w8jgt': {
      'ru': '',
      'kk': '',
    },
    'ujeaof48': {
      'ru': '',
      'kk': '',
    },
    'tjq70b7w': {
      'ru': '',
      'kk': '',
    },
    'n20nidn4': {
      'ru': '',
      'kk': '',
    },
    '7433dlll': {
      'ru': '',
      'kk': '',
    },
    'ga2j6czz': {
      'ru': '',
      'kk': '',
    },
    'lq29ksb2': {
      'ru': '',
      'kk': '',
    },
    'pg2sp13m': {
      'ru': '',
      'kk': '',
    },
    '6lweoajq': {
      'ru': '',
      'kk': '',
    },
    'rione46t': {
      'ru': '',
      'kk': '',
    },
    'hw5fni3b': {
      'ru': '',
      'kk': '',
    },
    '3g0xwv7x': {
      'ru': '',
      'kk': '',
    },
    'tpkkgbj0': {
      'ru': '',
      'kk': '',
    },
    'gyz1f8mi': {
      'ru': '',
      'kk': '',
    },
    '7x223er6': {
      'ru': '',
      'kk': '',
    },
    '35apmav2': {
      'ru': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
