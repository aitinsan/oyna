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
            title: 'Атау септіг',
            text:
                'В казахском языке в отличие от русского 7 падежей (в русском языке 6 падежей):\n\n 1. Атау септігі (именительный падеж) отвечает на вопросы кім? (кто?), не? (что?) (кімдер? нелер?) -множ. число. Например: Әлібек (кім?), адамдар (кімдер?), кітап (не?), кітаптар (нелер?) -окончаний нет.',
          ),
          GrammarCard(
            title: 'Ілік септік',
            text:
                '2. Ілік септігі (родительный падеж) отвечает на вопросы кімдер? (чей? чья? чье?), (кімдердің?), нелердің? (что? от чего?), нелердің? и выступает в значении определения. Ілік септігі имеет окончания -ның, -нің, -дың, -дің, -тың, -тің. Ілік септігі в речи всегда употребляется в сочетании с формой принадлежности ІІІ лица. Ілік септігі в предложении является определением и стоит перед определяемым словом. Определяемое слово употребляется в притяжательной форме. Например: Анардың (кімнің?) әжесі -Бабушка Анара. В казахском языке собственные имена, обозначающие названия городов, рек, улиц, гор и т.д., употребляются перед теми словами, к которым относятся, а последние -в притяжательной форме ІІІ лица. Абай көшесі -Улица Абая. Окончания ілік септік иногда опускается, но притяжательное окончание ІІІ лица (-сы, -сі, -ы, -і) всегда сохраняется. Например: институттың ректоры -институт ректоры. — Я приехал поездом.',
          ),
          GrammarCard(
            title: 'Барыс септік',
            text:
                '3. Барыс септігі (направительно-дательный падеж) соответствует русскому дательному падежу без предлога и с предлогом. Например: Әсияға (Асие), мұғалімге (учителю), Алматыға (в Алматы). Барыс септігі отвечает на вопросы кімге? (кому?), неге? (чему?), қайда? (куда?). Слова в барыс септік обозначают направление предмета к кому или чему-нибудь. Например: университет-ке (в университет), жұмыс-қа (на работу), үйі-ңе (домой). Барыс септігі образуется при помощи окончаний -ға/-ге, -қа/-ке, -на/-не, -а/-е. Послелоги дейін (шейін), қарай, бола употребляются только в сочетании с существительными дательного падежа.',
          ),
          GrammarCard(
            title: 'Табыс септік',
            text:
                '4. Табыс септігі (винительный падеж) по своему значению соответствует русскому винительному падежу без предлога и в предложении выступает в качестве прямого дополнения. Табыс септігі отвечает на вопросы кімді? кімдерді? (кого?, нені? нелерді? (что?). Например: оқушыны (ученика), газетті (газету). Существительные в табыс септік принимают окончания -ы/-ді, -ты/-ті, -ны/-ні, -н.',
          ),
          GrammarCard(
            title: 'Жатыс септік',
            text:
                '5. Жатыс септігі отвечает на вопросы кімде? кімдерде? (у кого?), неде? нелерде? (у чего?), қайда (где?), қашан? (Когда?). Например: Раушан лекцияда отыр. (Раушан сидит на лекции). Жатыс септігі имеет окончания -а/-де, -та/-те, -нда/-нде. В казахском языке жатыс септігі обозначает: Место нахождения лица или предмета. Например: Әйгерім Астанада тұрады. Киімдер шкафта ілулі тұр. Время действия и состояние предмета. Например: Жазда ауылға барамыз. Асқар түнде ұшады. Возраст человека. Например: Болат жиырмада, Әсел он сегізде.',
          ),
          GrammarCard(
            title: 'Шығыс септік',
            text:
                '6. Шығыс септігі (исходный падеж) Слова, отвечающие на вопросы кімнен? (от кого?), неден? (из чего?), қайдан? (откуда?) указывают на исходный пункт действия предмета или на материал, из которого сделан предмет. Например: Студент институттан келе жатыр. (Студент идет из института). Ол кірпіштен үй салып жатыр. (Он строит дом из кирпича). Окончания исходного падежа -нан/-нен, -дан/-ден, -тан/-тен варьируются в зависимости от того, на какой звук оканчивается слово.',
          ),
          GrammarCard(
            title: 'Көмектес септік',
            text:
                '7. Көмектес септік (инструментальный падеж) Көмектес септік образуется при помощи окончаний -мен, -бен, -пен и отвечает на вопросы кіммен? — с кем? , немен? — с чем?, қалай? — как? Слова в көмектес септік указывают, чем, при помощи чего совершается действие и всегда имеют мягкие окончания /-мен, -бен, -пен/ независимо от мягкости и твердости последнего слова /основы/ Например: Мен поезбен келдім — Я приехал поездом.',
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
        topic:
            'Сопоставьте слово в жирном шрифте с подходящим по значению словом',
        listeningCards: [
          ListeningCard(
            question: 'Предложение 1:  Бері тыңда да, ЕЛЕСТЕТІП КӨР.',
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
              WritingTask(question: 'Барыс септік', answer: 'ойыншыға'),
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
        topic: 'Падежи',
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
        topic: '',
        readingCard: ReadingCard(
          titleRu: '',
          textRu: '',
          titleKz: 'Ғалым туралы естелік',
          textKz:
              'Омбыдағы Кадет корпусында Шоқан Потанинмен дос болады. Потанин – қазақ халқының ауыз әдебиетін зерттеуші, ғалым Шоқан туралы естеліктерінде былай деп жазады: «...Мен Шоқанмен корпусқа оқуға келгенде таныстым. Ол орысша білмеді, мен қазақша білмедім. Бірақ Шоқан орыс тілін тез үйреніп алды. Екеуміз де кітап оқуды жақсы көрдік, әсіресе саяхатшылар туралы кітапқа қатты қызығатынбыз, сондықтан екеуміз жақсы дос болып кеттік. Мен қазақ даласы мен географиясы туралы білгенімді дәптерге жазып жүрдім. Шоқан сол жазуларды өз әңгімесімен толықтырады. Сөйтіп, біз қазақтардың бүркітпен аңға шығуын толық жаздық. Шоқан кейіннен оқуда орыс достарынан да озып кетті. Ақылды, дарынды балаға үлкендер де қызыға қарайтын. Демалыс күндері оны офицерлер мен Сібір шенеуніктері үйлеріне шақыратын. Ол қаладағы өнерлі, білімді адамдармен көп араласып тұрды. Шоқан өте көп оқитын, саяхатшы болуды армандайтын. Қаладағы кітапханадан кітап алу сол кезде тек Шоқанға ғана рұқсат етілді. Ол әкелген кітаптарды мен де оқитынмын. Біз Шоқаннан үлкен болсақ та, білім жағынан ол бізден әлдеқайда жоғары еді. Корпус оқушылары үшін Шоқан «Еуропаға ашылған терезе» секілді еді».',
          question: 'Дұрыс жауапты таңдаңыз',
          readingTests: [
            ReadingTest(
              question: 'Шоқан кім боламын деп армандайды?',
              list: [
                ReadingTestOption(text: 'Саяхатшы ', isCorrect: true),
                ReadingTestOption(text: 'Жазушы', isCorrect: false),
                ReadingTestOption(text: 'Аудармашы. ', isCorrect: false),
                ReadingTestOption(text: 'Әнші. ', isCorrect: false),
                ReadingTestOption(text: 'Әртіс', isCorrect: false),
              ],
            ),
            ReadingTest(
              question: ' Мәтін бойынша толық және нақты ақпаратты табыңыз',
              list: [
                ReadingTestOption(
                    text: 'Шоқанның өнерлі достары өте көп', isCorrect: true),
                ReadingTestOption(
                    text: 'Ол білімді адамдармен жақсы таныс болмған',
                    isCorrect: false),
                ReadingTestOption(
                    text:
                        'Шоқан қаладағы өнерлі, білімді адамдармен жақын араласқан емес.',
                    isCorrect: false),
                ReadingTestOption(
                    text: 'Шоқан өте көп оқитын, саяхатшы болуды армандайтын',
                    isCorrect: false),
                ReadingTestOption(
                    text: 'барлық жауаптар дұрыс', isCorrect: false),
              ],
            ),
            ReadingTest(
              question: 'Мәтінде жауабы жоқ сұрақты таңдаңыз.',
              list: [
                ReadingTestOption(
                    text: 'Шоқан Омбыда тұрды ма? ', isCorrect: false),
                ReadingTestOption(
                    text: 'Шоқан кітапханада кіммен танысты?',
                    isCorrect: false),
                ReadingTestOption(
                    text: 'Шоқан мен Потанин қалай дос болды?',
                    isCorrect: true),
                ReadingTestOption(
                    text: 'Шоқанның саяхатқа кімдермен барды?',
                    isCorrect: false),
                ReadingTestOption(
                    text: 'Шоқан орыс тілін үйренді ме?', isCorrect: false),
              ],
            ),
            ReadingTest(
              question: ' Шоқан қайда туған?',
              list: [
                ReadingTestOption(text: 'Омбыда', isCorrect: false),
                ReadingTestOption(text: 'Қостанайда', isCorrect: false),
                ReadingTestOption(text: 'Құсмұрында', isCorrect: false),
                ReadingTestOption(text: 'Алматыда', isCorrect: false),
                ReadingTestOption(text: 'Еуропада', isCorrect: false),
              ],
            ),
          ],
        ),
      ),
      OneOfFour(
          type: 'Практика - Тыңдалым',
          topic: 'Қалың шрифтпен жазылған сөздің синонимін табыңыз',
          listeningCards: [
            ListeningCard(
              question: 'Предложение 1:  Бері тыңда да, ЕЛЕСТЕТИП КӨР.',
              video: 'assets/videos/listening1.mp4',
              textRu:
                  '',
              test: [
                ListeningTest(text: 'көз алдына келтіріп көр', isCorrect: true),
                ListeningTest(text: 'көзіңді аш', isCorrect: false),
                ListeningTest(text: 'айт', isCorrect: false),
                ListeningTest(text: 'тыңдама', isCorrect: false),
              ],
            ),
            ListeningCard(
              question: 'Предложение второе: Міне финалға да ЖЕТІП ҚАЛДЫҚ ',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'ұтылдық', isCorrect: false),
                ListeningTest(text: 'келіп қалдық', isCorrect: true),
                ListeningTest(text: 'жетіп қалдық', isCorrect: false),
                ListeningTest(text: 'кетіп қалдық', isCorrect: false),
              ],
            ),
            ListeningCard(
              question: 'Предложение третье: Мен де ТЫРЫСАМЫН',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'талаптану', isCorrect: false),
                ListeningTest(text: 'қалығу', isCorrect: false),
                ListeningTest(text: 'жалығу', isCorrect: false),
                ListeningTest(text: 'тырыспаймын', isCorrect: true),
              ],
            ),
            ListeningCard(
              question:
                  'Предложение четвертое: Біз финалдамыз, ал біздің ҚАРСЫЛАСТАРЫМЫЗ Шираторизава ',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'дұшпандар', isCorrect: false),
                ListeningTest(text: 'ойыншылар', isCorrect: false),
                ListeningTest(text: 'одақтастар', isCorrect: true),
                ListeningTest(text: 'көрермендер', isCorrect: false),
              ],
            ),
          ]),
      OneOfFour(
        type: 'Практика - Жазылым',
        topic: '',
        writingCard: WritingCard(
            taskDescription:
                'Сөздік жұптың омоним,антоним немесе синоним екенін жазыңыз',
            tasks: [
              WritingTask(question: 'Алма-алма', answer: 'омоним'),
              WritingTask(question: 'Аласа-биік', answer: 'антоним'),
              WritingTask(question: 'Сұлу-көрікті', answer: 'синоним'),
              WritingTask(question: 'Ыстық-суық', answer: 'антоним'),
              WritingTask(question: 'Дөрекі-сыпайы', answer: 'синоним'),
              WritingTask(question: 'Алыс - ит өлген жер', answer: 'синоним'),
              WritingTask(question: 'ат-ат', answer: 'омоним'),
            ]),
      ),
    ],
  ),
  Day(
    day: 3,
    oneOfFours: [
      OneOfFour(
        type: 'Грамматика',
        topic: 'Құрмалас сөйлем',
        grammarCards: [
          GrammarCard(
            title: 'Құрмалас сөйлем',
            text:
                'Екі немесе одан да көп жай сөйлемдерден құралып, күрделі ойды білдіретін сөйлемдер құрмалас сөйлем деп аталады. Құрмалас сөйлемнің мағыналық жағынан өзгешеліктері: Құрмалас сөйлем күрделі ойды білдіреді. Құрмалас сөйлемнің бірінші сыңары екіншісімен ұласпалы интонациямен айтылады. Құрмалас сөйлемнің сыңарлары интонациялық жағынан тиянақсыз болады. Құрмалас сөйлемнің алғашқы сыңары аяқталған ойды білдіре алмайды, бүтіннің бір бөлшегі болып табылады. Құрамындағы жай сөйлемдердің салаласа, сабақтаса байланысуына орай құрмалас сөйлемдер: салалас құрмалас, сабақтас құрмалас және аралас құрмалас болып үш түрге бөлінеді.',
          ),
          GrammarCard(
            title: 'Салалас құрмалас сөйлем',
            text:
                'Кемінде екі жай сөйлемнен құралады Өзара тең дәрежеде байланысады, баяндауыштары тиянақты болады. Әлден уақытта екі атты кісі келді де, мені ағаштан шешіп алды.',
          ),
          GrammarCard(
            title: 'Сабақтас құрмалас сөйлем',
            text:
                ' Кемінде екі жай сөйлемнен құралады Бірі екіншісіне бағынады, бірінші сөйлемнің баяндауыштары тиянақсыз болады. Жігіттер жабылып болмаған соң, әнші сандыққа отырды.',
          ),
          GrammarCard(
            title: 'Аралас құрмалас сөйлем',
            text:
                'Кемінде екі жай сөйлемнен құралады Өзара салаласып та, сабақтасып та байланысады. Қыздың маңдайынан сипады да, толқындай қара шашынан бір сүйіп, өз жөнімен кете берді.',
          ),
        ],
      ),
      OneOfFour(
        type: 'Практика - Оқылым',
        topic: '',
        readingCard: ReadingCard(
            titleRu: '',
            textRu: '',
            titleKz: 'КИІЗ БАСУ',
            textKz:
                'Киіз басу – дәстүрлі қазақ қоғамында дамыған өнер түрі. Оған жүн талшықтарының бір-бірімен ұйыса байланысатын қасиеті негізге алынған. Қазіргі заманғы шұға басу, байпақ жасау, фетр басу процестері де киіз басу дәстүрлі технологиясымен бірдей. Жүн – ұйысуға бейім талшық. Ол ылғал мен температура әсерінен және механикалық әрекет нәтижесінде ширайды да, бұйымның көлемі кішірейіп, тығыздығы артады. Киіз басудағы ең жоғары тығыздық – 0,55 г/см³ (байпақтың табаны –  0,42 г/см³). Тығыздығын бұдан әрі арттырса, жүн талшықтары үзіліп, материал ыдырай бастайды. Киіз басу ісімен қазақ халқы ертенден таныс. Ғасырлар бойы көшпелі өмірге ыңғайлы тұрмыстық бұйымдардың бірқатарын киізден жасап келгендіктен, киіз басу технологиясын әбден меңгеріп, өнер дәрежесіне көтерген. Дәстүрлі қазақ қоғамында киіз басу ісі маусымдық сипатта болған. Ол қойды қырқудан басталады да, қырқылған күзем жүннің барлығын өңдеп болғанға дейін созылады. Киіз басу барысы бірнеше кезеңдерден тұрады. Солардың бірі – булау. Қайнап тұрған ыстық суды шелекпен әкеліп, сүзгімен шидің бір жақ шетінен бастап себелеп құяды. Құйылған су өз салмағымен жүнді басып, шабақталған жүн мен тартылған жүнді біріне-бірін қосып жабыстырады. Ыстық су жүннің талшықтарын буландырып жібітеді, оның тез киізденуіне жағдай жасайды. Су себіле басталысымен, үш-төрт әйел басылып жатқан жүнді сыртындағы шимен қабаттай шиыршықтап жинайды. Шиді ширатып орап жинаған сайын әлсін-әлсін ыстық су құйылады. Түгел жиналған шидің сыртынан жіппен шандып, жұмырлап байлайды да, ортан белінен арқанды өткізіп алып домалатады, екі басын тұйықтап бос салып қояды. Бүктеліп  әзір жатқан шидің өн бойын бойлай 10-12 адам қатар жүріп келе жатып, шиге орауы киізді аяқтарымен теуіп отырады. Бұларға қарама-қарсы бір адам киізді алға қарай домалатады. Сосын шидің шандуларын шешіп, шиыршықталған киізді жазып босатады. Киіздің асты-үстін ауыстырып отырып, үш-төрт рет шиыршықтап бүктейді. Екі басын түйістіріп шұжыққа ұқсатып көктеп алып, тағы да ыстық су құйып, үстін тонмен жылылап жауып тастап булайды.',
            question: '',
            readingTests: [
              ReadingTest(
                question: 'Механикалық әрекет нәтижесінде ширайтын зат',
                list: [
                  ReadingTestOption(text: 'Шуда', isCorrect: false),
                  ReadingTestOption(text: 'Тон', isCorrect: false),
                  ReadingTestOption(text: 'Ши', isCorrect: false),
                  ReadingTestOption(text: 'Сүзгі', isCorrect: false),
                  ReadingTestOption(text: 'Жүн', isCorrect: true),
                ],
              ),
              ReadingTest(
                question: 'Киіз басуға қажетті зат',
                list: [
                  ReadingTestOption(text: 'Қойдың жүні', isCorrect: true),
                  ReadingTestOption(text: 'Аттың жалы', isCorrect: false),
                  ReadingTestOption(text: 'Сиырдың терісі', isCorrect: false),
                  ReadingTestOption(text: 'Түйенің шудасы', isCorrect: false),
                  ReadingTestOption(text: 'Ешкінің түбіті', isCorrect: false),
                ],
              ),
              ReadingTest(
                question: 'Киізді булау кезінде қолданылатын негізгі зат',
                list: [
                  ReadingTestOption(text: 'Фетр', isCorrect: false),
                  ReadingTestOption(text: 'Бояу', isCorrect: false),
                  ReadingTestOption(text: 'Уық', isCorrect: false),
                  ReadingTestOption(text: 'Шұға', isCorrect: false),
                  ReadingTestOption(text: 'Ши', isCorrect: true),
                ],
              ),
            ]),
      ),
      OneOfFour(
          type: 'Практика - Тыңдалым',
          topic: 'Астында берілген бос орынды толтырыңыз',
          listeningCards: [
            ListeningCard(
              question:
                  'Cөйлем 1: Бұқар жыраумен өлер алдында қоштасып,іштегіарманын сыртқа шығарып, ___ айтып қалайын дегендей асыға тіл қатты       ',
              video: 'assets/videos/listening1.mp4',
              textRu: '',
              test: [
                ListeningTest(text: 'өңіндегісін', isCorrect: true),
                ListeningTest(text: 'өңіндегіні', isCorrect: false),
                ListeningTest(text: 'өз еліндегіні', isCorrect: false),
                ListeningTest(text: 'өсиетіні', isCorrect: false),
              ],
            ),
            ListeningCard(
              question:
                  'Сөйлем 2: Бірақ мен сол ____ да, озбырлығымды да, халқымды уысында ұстау үшін... ',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'қияпатымды', isCorrect: false),
                ListeningTest(text: 'қиянатымды', isCorrect: true),
                ListeningTest(text: 'қанағатымды', isCorrect: false),
                ListeningTest(text: 'қалағанымды', isCorrect: false),
              ],
            ),
            ListeningCard(
              question:
                  'Сөйлем 3: Сәл ойланып жатты да Бұқарға көз ____ аударды ',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'қиыған', isCorrect: true),
                ListeningTest(text: 'қинығын', isCorrect: false),
                ListeningTest(text: 'тиығын', isCorrect: false),
                ListeningTest(text: 'қиығын', isCorrect: true),
              ],
            ),
            ListeningCard(
              question:
                  'Сөйлем 4: Сол ақ патшамен найза арқылы емес , _____ тіл табыссын ',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'көз арқылы', isCorrect: false),
                ListeningTest(text: 'төз арқылы', isCorrect: false),
                ListeningTest(text: 'сөз арқылы', isCorrect: true),
                ListeningTest(text: 'тіл арқылы', isCorrect: false),
              ],
            ),
            ListeningCard(
              question:
                  'Сөйлем 5 пятое: Абылай хан, ___  Әбілмансұр, 1711 жылы Түркістанда туылған',
              video: '',
              textRu: '',
              test: [
                ListeningTest(text: 'шынайы аты', isCorrect: true),
                ListeningTest(text: 'шын аты', isCorrect: false),
                ListeningTest(text: 'шың аты', isCorrect: false),
                ListeningTest(text: 'жын аты', isCorrect: false),
              ],
            ),
          ]),
      OneOfFour(
        type: 'Практика - Жазылым',
        topic: '',
        writingCard: WritingCard(taskDescription: '', tasks: [
          WritingTask(
            question: 'Күн шығып, ел тұра бастады, - Нұрлан әлі жоқ.',
            answer: 'Аралас',
          ),
          WritingTask(
            question: 'Төлеутай әскерге кетті де, содан қайтып оралмады.',
            answer: 'Cалалас',
          ),
          WritingTask(
            question:
                'Көмекші жігіт қойларды ерте айдап әкеліпті, себебі күннің арты бұзылып келе жатқанын байқайды.',
            answer: 'Салалас',
          ),
          WritingTask(
            question:
                'Ауырғанда жаным көзіме көрініп барады, бірақ анамды қинағым келмейді.',
            answer: 'Салалас',
          ),
          WritingTask(
            question:
                'Тасқынның қаттылығы сонша – жолындағының бәрін жапырып кетті.',
            answer: 'Салалас',
          ),
          WritingTask(
            question: 'Күн жылы болғандықтан , біз серуенге шықтық',
            answer: 'Сабақтас',
          ),
          WritingTask(
            question: 'Далада жаурағанша , үйде отырайық .',
            answer: 'Cабақтас',
          ),
        ]),
      ),
    ],
  ),
];
