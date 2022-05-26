import 'package:oyna/model/grammar_card.dart';
import 'package:oyna/model/listening_card.dart';
import 'package:oyna/model/one_of_four.dart';
import 'package:oyna/model/reading_card.dart';
import 'package:oyna/model/writing_card.dart';

class Day {
  int day;
  List<OneOfFour> oneOfFours;
  Day({
    required this.day,
    required this.oneOfFours,
  });
}

List days = [
  Day(
    day: 1,
    oneOfFours: [
      OneOfFour(
        type: 'Грамматика',
        topic: 'Синоним, Антоним, Омоним',
        grammarCards: [
          GrammarCard(
            title: 'Антоним',
            text:
                'Мағыналары бір-біріне қарама-қарсы сөздер антонимдер деп аталады. Мысалы, елгезек бала-тілазар бала, шабан ат-жүрдек ат, іскер адам-олақ адам, жақсы мінез-жаман мінез, қисық ағаш-түзу ағаш, тату көрші- араз көрші, т.б. Тілімізде антоним сөздер мақал-мәтелдерде, жұмбақтарда көп кездеседі.',
          ),
          GrammarCard(
            title: 'Антоним',
            text:
                'Мысалы, Ащы мен тұщыны татқан білер, алыс пен жақынды жортқан білер. Аз сөз – алтын, көп сөз – көмір, т.б. Осы мысалдардағы ащы-тұщы, алыс-жақын, аз-көп сөздері – мағыналары бір-біріне қарама-қарсы айтылған антоним сөздер.',
          ),
          GrammarCard(
            title: 'Омоним',
            text:
                'Омоним – сыртқы тұлғасы: айтылуы, естілуі, жазылуы бірдей, мағыналары әртүрлі сөздер. Сыртқы тұлғасы жағынан омоним сөздер мен көп мағыналы сөздер ұқсас болып келеді. Омоним болудың негізгі белгісі сөздердің арасында мағыналық байланыс болмайды, яғни омоним сөздер әртүрлі мағынада қолданылады, ал көп мағыналы сөздердің арасында мағыналық байланыс болады, көп мағыналы сөздер бір сөз табынан болып, бір негізден тарайды.',
          ),
          GrammarCard(
            title: 'Омоним',
            text:
                'Мысалы, Басыңды жоғары көтеріп, аяғыңды жылдам бас деген сөйлемдегі бас сөзі омоним, себебі бірінші бас сөзі адамның дене мүшесі – не? деген сұраққа жауап беретін, заттық ұғым атауы болатын зат есім, екінші бас сөзі – не істе? деген сұраққа жауап беретін қимыл-әрекет атауы болатын етістік. Ал Талдың басына қарлығаш ұя салыпты. Жолаушылар бұлақтың басына келіп демалды деген сөйлемдердегі бас сөзі – көп мағыналы сөз, себебі. 1) бір нәрсенің бастау алатын жері деген бірдей мағынаға ие болып тұр; 2) екеуі де бір сөз табынан зат есім болып тұр.',
          ),
          GrammarCard(
            title: 'Омоним',
            text:
                'Омофон дегеніміз айтылуы бірдей, бірақ жазылуы әр түрлі сөздер. Егер омонимдер айтылуы да, жазылуы да бірдей, бірақ мағыналары басқа сөздер болып келсе, ал омофондар тек айтылуы бірдей болғанмен, шын мәнінде омоним емес сөздер, сондықтан олар жазуда әр түрлі таңбаланады. Тіл білімінде омофондардың шын мәнінде омонимдер еместігі ескеріліп, олар кейде жалған омонимдер, кейде сөздердің айтылуындағы ұқсастығына қарап фонетикалық омонимдер деп аталады. Мысалы: көнбе және көмбе.',
          ),
          GrammarCard(
            title: 'Синоним',
            text:
                'Айтылуы, естілуі, жазылуы әр алуан, мағыналары бір-біріне жақын, жуық мәнді сөздер синонимдер деп аталады. Синонимге тән негізгі белгілер: 1) синоним сөздер әртүрлі дыбысталады; 2) синоним сөздердің мағынасы бір-біріне жақын болып келеді; 3) синоним сөздер бір сөз табынан болады.',
          ),
          GrammarCard(
            title: 'Синоним',
            text:
                'Мысалы, Апатты аймаққа көмекші, жәрдемші топ келді деген сөйлемдегі көмекші, жәрдемші сөзі бірінің орнына бірін ауыстырып қолдануға болатын, мағыналары бір-біріне жақын, бір сөз табынан болған синоним сөздер. Тілімізде синоним сөздер зат есімдерден, сын есімдерден, етістіктерден және үстеулерден кездеседі. Синоним болып жұмсалатын мәндес сөздердің тобын синонимдік қатар немесе синонимдік ұя деп атайды.',
          ),
        ],
      ),
      OneOfFour(
        type: 'Практика - Оқылым',
        topic: 'Синоним, Антоним, Омоним',
        readingCard: ReadingCard(
          titleRu: 'Она ложится спать',
          textRu:
              'Она надевает пижаму. Она ложится спать. Она кладёт голову на подушку. Она поправляет подушку. Сейчас подушка становится удобнее. Лампа ещё горит. Она выключает лампу. Сейчас в комнате темно. Она снова кладёт голову на подушку. Она засыпает.',
          titleKz: 'Ол ұйықтауға жатты',
          textKz:
              ' Қыз пижамасын киеді. Ол ұйықтауға жатады. Жастыққа басын қойды. Ол жастығын дұрыстады. Қазір жастығы жайлы болды. Жарық әлі жанып тұр. Ол жарықты өшірді. Қазір бөлмеде қараңғы. Ол басын тағы да жастыққа салды. Ол ұйықтайды.',
          question: 'Подберите правильный перевод:',
          readingQuestions: [
            ReadingQuestion(
              question: 'ложится спать',
              answer: 'ұйықтауға жатады',
            ),
            ReadingQuestion(
              question: 'подушка',
              answer: 'жастық',
            ),
            ReadingQuestion(
              question: 'выключил(а) свет',
              answer: 'жарықты өшірді',
            ),
            ReadingQuestion(
              question: 'комната',
              answer: 'бөлме',
            ),
            ReadingQuestion(
              question: 'темно',
              answer: 'қараңғы',
            ),
            ReadingQuestion(
              question: '',
              answer: 'қазір',
            ),
            ReadingQuestion(
              question: '',
              answer: 'дұрыстады',
            ),
          ],
        ),
      ),
      OneOfFour(
        type: 'Практика - Тыңдалым',
        topic: 'Синоним, Антоним, Омоним',
        listeningCards: [
          ListeningCard(
            question: 'Предложение 1:  Бері тыңда да, ЕЛЕСТЕТИП КӨР.',
            video: 'assets/videos/listening1.mp4',
            textRu:
                'Вот мы и добрались до финала Рю, нет необходимости бояться Я не боюсь! Прислушайся и представь. Мы в финале, а наш противник Шираторизава. Что будет если играть перед такой большой толпой? Как думаешь? Говоришь, что будет? Сильные игроки обычно такие привлекательные Нишиноя-кун, Танака-кун. Мы вас любим! Танака-кун...Молодцы Порвём их, Ноя-сан? После этой игры меня будут называеть героем! Я тоже постараюсь',
            test: [
              ListeningTest(text: 'представь', isCorrect: true),
              ListeningTest(text: 'открой глаза', isCorrect: false),
              ListeningTest(text: 'скажи', isCorrect: false),
              ListeningTest(text: 'послушай', isCorrect: false),
            ],
          ),
          ListeningCard(
            question: 'Предложение второе: Міне финалға да ЖЕТІП ҚАЛДЫҚ ',
            video: '',
            textRu: '',
            test: [
              ListeningTest(text: 'проиграли', isCorrect: false),
              ListeningTest(text: 'добрались', isCorrect: true),
              ListeningTest(text: 'выиграли', isCorrect: false),
              ListeningTest(text: 'ушли', isCorrect: false),
            ],
          ),
          ListeningCard(
            question: 'Предложение третье: Мен де ТЫРЫСАМЫН',
            video: '',
            textRu: '',
            test: [
              ListeningTest(text: 'подумаю', isCorrect: false),
              ListeningTest(text: 'постараюсь', isCorrect: true),
              ListeningTest(text: 'посмотрю', isCorrect: false),
              ListeningTest(text: 'рад', isCorrect: false),
            ],
          ),
          ListeningCard(
            question:
                'Предложение четвертое: Біз финалдамыз, ал біздің ҚАРСЫЛАСТАРЫМЫЗ Шираторизава ',
            video: '',
            textRu: '',
            test: [
              ListeningTest(text: 'союзники', isCorrect: false),
              ListeningTest(text: 'враги', isCorrect: false),
              ListeningTest(text: 'противиники', isCorrect: true),
              ListeningTest(text: 'друзья', isCorrect: false),
            ],
          ),
          ListeningCard(
            question:
                'Предложение пятое: Мықты ОЙЫНШЫЛАР әдетте сондай сымбатты көрінеді ',
            video: '',
            textRu: '',
            test: [
              ListeningTest(text: 'зрители', isCorrect: false),
              ListeningTest(text: 'игроки', isCorrect: true),
              ListeningTest(text: 'тренера', isCorrect: false),
              ListeningTest(text: 'противники', isCorrect: false),
            ],
          ),
        ],
      ),
      OneOfFour(
        type: 'Практика - Жазылым',
        topic: 'Синоним, Антоним, Омоним',
        writingCard: WritingCard(
            taskDescription:
                'Напишите слово во всех правильных падежных окончаниях\n ОЙЫНШЫ - ИГРОК ',
            tasks: [
              WritingTask(question: 'Атау септік', answer: 'ойыншы'),
              WritingTask(question: 'Ілік септік', answer: 'ойыншының'),
              WritingTask(question: 'Барыс септік', answer: 'ойыншымның'),
              WritingTask(question: 'Табыс септік', answer: 'ойыншыны'),
              WritingTask(question: 'Жатыс септік', answer: 'ойыншы'),
              WritingTask(question: 'Шығыс септік', answer: 'ойыншыдан'),
              WritingTask(question: 'Көмектес септік', answer: 'ойыншымен'),
            ]),
      ),
    ],
  ),
  Day(
    day: 2,
    oneOfFours: [
      OneOfFour(
        type: 'Грамматика',
        topic: '',
        grammarCards: [
          GrammarCard(
            title: '',
            text: '',
          ),
        ],
      ),
      OneOfFour(
        type: 'Практика - Оқылым',
        topic: '',
        readingCard: ReadingCard(
          titleRu: '',
          textRu: '',
          titleKz: '',
          textKz: '',
          question: '',
          readingQuestions: [
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
            ReadingQuestion(
              question: '',
              answer: '',
            ),
          ],
        ),
      ),
      OneOfFour(type: 'Практика - Тыңдалым', topic: '', listeningCards: [
        ListeningCard(
          question: '',
          video: '',
          textRu: '',
          test: [
            ListeningTest(text: '', isCorrect: true),
            ListeningTest(text: '', isCorrect: false),
            ListeningTest(text: '', isCorrect: false),
            ListeningTest(text: '', isCorrect: false),
          ],
        ),
      ]),
      OneOfFour(
        type: 'Практика - Жазылым',
        topic: '',
        writingCard: WritingCard(taskDescription: '', tasks: [
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
          WritingTask(question: '', answer: ''),
        ]),
      ),
    ],
  ),
];
