import 'package:flutter_ossetian_learning_app/models/course.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';

class CourseRepositoryInMemory extends AbstractCourseRepository {
  CourseRepositoryInMemory();
// Генерация демо-данных с уроками и блоками
  List<Course> _courses =
    [
      // КУРС 1: РАЗГОВОРНЫЙ ОСЕТИНСКИЙ ЯЗЫК
      Course(
        name: 'Разговорный осетинский язык',
        description: 'Базовый курс для начинающих. Научитесь говорить на основные темы: семья, еда, погода, работа.',
        rating: 4.9,
        author: 'Мадина Дзарахохова',
        category: 'Популярное',
        urlPhoto: "https://alpindustria.ru/UserFiles/Image/IMG_5372.jpg",
        lessons: [
          Lesson(
            title: 'Урок 1: Приветствия и знакомство',
            description: 'Научитесь здороваться, прощаться и представляться',
            blocks: [
              TheoryBlock(
                title: 'Основные приветствия',
                contentType: ContentType.text,
                content: '''
  📚 В осетинском языке есть несколько форм приветствия:

  • Салам (Salam) - универсальное приветствие
  • Бон ран (Bon ran) - доброе утро (до 12:00)
  • Бон хорз (Bon xorz) - добрый день (12:00-18:00)
  • Изар хорз (Izarv xorz) - добрый вечер (после 18:00)
  • Фæндæгты бон хорз (Fændægty bon xorz) - счастливого пути

  💫 Важно: В осетинском культуре принято здороваться даже с незнакомыми людьми!

  Прощания:
  • Фæндæгты хорз (Fændægty xorz) - счастливого пути (уходящему)
  • Кæддæриддæр (Kæddæriddær) - до свидания (нейтральное)
  • Бон хорз (Bon xorz) - хорошего дня
  ''',
              ),
              QuizBlock(
                title: 'Проверьте знание приветствий',
                choices: ['Салам', 'Бон ран', 'Хорз', 'Фæндаг'],
                correctChoiceIndices: [0, 1],
                allowMultiple: true,
              ),
              TheoryBlock(
                title: 'Как представиться',
                contentType: ContentType.text,
                content: '''
  🗣️ Фразы для знакомства:

  • Мæ ном у... (Mæ nom u...) - Меня зовут...
  • Дæ ном чи у? (Dæ nom či u?) - Как тебя зовут?
  • Æз... (Æz...) - Я...
  • Цы кусыс? (Cy kusys?) - Кем ты работаешь?
  • Мæнæ... (Mænæ...) - Это...

  Пример:
  "Мæ ном у Мадина. Æз лæппу. Дæ ном чи у?"

  ✨ Диалог-пример:
  - Салам! Мæ ном у Алан. Дæ ном чи у?
  - Салам! Мæ ном у Зарина.
  - Хорз, Зарина. Цы кусыс?
  - Æз ахуыргæнæг дæн. А уый дæ?
  ''',
              ),
              TrueFalseBlock(
                title: '"Бон хорз" используется только утром',
                correctAnswer: false,
              ),
              TextInputBlock(
                title: 'Как сказать "Меня зовут Алан" по-осетински?',
                correctAnswer: 'мæ ном у алан',
                caseSensitive: false,
              ),
            ],
          ),
          Lesson(
            title: 'Урок 2: Моя семья',
            description: 'Изучаем названия членов семьи и родственников',
            blocks: [
              TheoryBlock(
                title: 'Члены семьи 👨‍👩‍👧‍👦',
                contentType: ContentType.text,
                content: '''
  Семья (Бинонтæ):

  Ближайшие родственники:
  • Мад (Mad) - мать
  • Фыд (Fyd) - отец
  • Æфсымæр (Æfsymær) - брат
  • Хо (Xo) - сестра
  • Фырт (Fyrt) - сын
  • Чызг (Čyzg) - дочь

  Супруги:
  • Мой (Moj) - муж
  • Ус (Us) - жена

  Другие родственники:
  • Дада (Dada) - дедушка
  • Аба (Aba) - бабушка
  • Æрвад (Ærvad) - родственник

  📝 Фразы:
  • Мæ мад - моя мама
  • Дæ фыд - твой отец
  • Йæ хо - его/ее сестра
  ''',
              ),
              QuizBlock(
                title: 'Выберите правильные переводы',
                choices: ['Мад = мать', 'Фырт = дочь', 'Æфсымæр = брат', 'Хо = отец'],
                correctChoiceIndices: [0, 2],
                allowMultiple: true,
              ),
              TextInputBlock(
                title: 'Как будет "моя сестра" на осетинском?',
                correctAnswer: 'мæ хо',
                caseSensitive: false,
              ),
              TheoryBlock(
                title: 'Составляем предложения',
                contentType: ContentType.text,
                content: '''
  📖 Примеры предложений:

  • Мæ мад ахуыргæнæг у - Моя мама учитель
  • Æз мæ фыдæ фесауын - Я похож на отца
  • Нæ бинонтæ стыр сты - Наша семья большая
  • Уый мæ æфсымæр у - Это мой брат

  🎯 Задание: Составьте 3 предложения о своей семье используя новые слова
  ''',
              ),
            ],
          ),
          Lesson(
            title: 'Урок 3: Числа и счет',
            description: 'Учимся считать на осетинском языке',
            blocks: [
              TheoryBlock(
                title: 'Числа от 1 до 10 🔢',
                contentType: ContentType.text,
                content: '''
  Ирон диалект (основные числа):

  1 - Иу (Iu)
  2 - Дыууæ (Dyuuyæ)
  3 - Æртæ (Ærtæ)
  4 - Цыппар (Cyppar)
  5 - Фондз (Fondz)
  6 - Æхсæз (Æxsæz)
  7 - Авд (Avd)
  8 - Аст (Ast)
  9 - Фараст (Farast)
  10 - Дæс (Dæs)

  📝 Правила произношения:
  • Ударение обычно падает на первый слог
  • Дыууæ произносится с долгим "у"
  • Æртæ - мягкое "р"
  ''',
              ),
              QuizBlock(
                title: 'Какое число пропущено: иу, дыууæ, __, цыппар?',
                choices: ['Фондз', 'Æртæ', 'Авд', 'Дæс'],
                correctChoiceIndices: [1],
                allowMultiple: false,
              ),
              TrueFalseBlock(
                title: 'Число 10 на осетинском - "Дæс"',
                correctAnswer: true,
              ),
            ],
          ),
        ],
      ),

      // КУРС 2: ОСЕТИНСКИЙ АЛФАВИТ И ФОНЕТИКА
      Course(
        name: 'Осетинский алфавит и фонетика',
        description: 'Изучите буквы, звуки и правильное произношение. 44 буквы осетинского алфавита.',
        rating: 4.8,
        author: 'Сослан Хабалов',
        category: 'Популярное',
        urlPhoto: "https://a.d-cd.net/AFsBdNI-oLjuEU6v8DseCnkB_8U-1920.jpg",
        lessons: [
          Lesson(
            title: 'Урок 1: Гласные буквы и звуки',
            description: 'Изучаем 7 гласных осетинского языка',
            blocks: [
              TheoryBlock(
                title: 'Гласные осетинского алфавита 🗣️',
                contentType: ContentType.text,
                content: '''
  🎵 В осетинском языке 7 гласных букв:

  А (A) - как в слове "арм"
  • Пример: Арв (небо), Ахур (учение)

  Ӕ (Æ) - УНИКАЛЬНЫЙ звук! Среднее между А и Э
  • Пример: Ӕвзаг (язык), Мæ (я/меня)
  • 💡 Совет: попробуйте произнести "а" и "э" одновременно

  Е (E) - как в слове "еда"
  • Пример: Ертæ (три), Бæрз (много)

  И (I) - как в слове "мир"
  • Пример: Иу (один), Циу (коза)

  О (O) - как в слове "окно"
  • Пример: Оскъ (берлога), Хох (гора)

  У (U) - как в слове "ум"
  • Пример: Уал (сено), Фурд (море)

  Ы (Y) - твердый звук, как в слове "крыса"
  • Пример: Сырх (красный), Хъысмæт (судьба)

  🎯 Практика: Прочитайте вслух: А, Ӕ, Е, И, О, У, Ы
  ''',
              ),
              QuizBlock(
                title: 'Какая буква является уникальной для осетинского языка и отсутствует в русском?',
                choices: ['Ы', 'Ӕ', 'Е', 'У'],
                correctChoiceIndices: [1],
                allowMultiple: false,
              ),
              TextInputBlock(
                title: 'Напишите осетинскую букву, обозначающую звук между "а" и "э"',
                correctAnswer: 'ӕ',
                caseSensitive: true,
              ),
            ],
          ),
          Lesson(
            title: 'Урок 2: Особые согласные',
            description: 'Изучаем специфические согласные звуки',
            blocks: [
              TheoryBlock(
                title: 'Особые согласные 🔊',
                contentType: ContentType.text,
                content: '''
  В осетинском есть звуки, которых нет в русском языке:

  Лабиальные (губные):
  • Ф (F) - придыхательный, звонкий
  • П (P) - взрывной
  • Б (B) - звонкий

  Дентальные (зубные):
  • Т' (T') - абуптивный! Щелкающий звук
  • Д (D) - звонкий
  • Ц (C) - аффриката

  Увулярные (образуются маленьким язычком):
  • Х (X) - увулярный
  • Къ (K') - абруптивный
  • Гъ (G') - фарингальный

  🎪 Практическое упражнение:
  Попробуйте произнести "Къ" - как будто вы кашляете, но короче
  Попробуйте "Т'" - как щелчок языком о нёбо
  ''',
              ),
              QuizBlock(
                title: 'Какие звуки относятся к абруптивным?',
                choices: ['Къ', 'Т', 'П', 'Т\'', 'Х'],
                correctChoiceIndices: [0, 3],
                allowMultiple: true,
              ),
              TrueFalseBlock(
                title: 'Звук "Къ" произносится как обычный "к" в русском языке',
                correctAnswer: false,
              ),
            ],
          ),
        ],
      ),

      // КУРС 3: ОСЕТИНСКИЙ ДЛЯ ПУТЕШЕСТВИЙ
      Course(
        name: 'Осетинский для путешествий',
        description: 'Фразы и выражения для туристов в Северной и Южной Осетии.',
        rating: 4.6,
        author: 'Георгий Дзугаев',
        category: 'Популярное',
        urlPhoto: "https://photocentra.ru/images/main107/1073032_main.jpg",
        lessons: [
          Lesson(
            title: 'В аэропорту и транспорте',
            description: 'Необходимые фразы для поездки',
            blocks: [
              TheoryBlock(
                title: 'В аэропорту ✈️',
                contentType: ContentType.text,
                content: '''
  Полезные фразы для путешественников:

  В аэропорту:
  • Аэропорт кæм ис? (Aeroport kæm is?) - Где находится аэропорт?
  • Мæнæ мæ паспорт (Mænæ mæ passport) - Вот мой паспорт
  • Мæ билет (Mæ bilet) - Мой билет
  • Чысыл фæндаг (Čysyl fændag) - небольшой перелет

  Такси и транспорт:
  • Такси æвæрд кæм ис? (Taksi æværd kæm is?) - Где стоянка такси?
  • Цы фæкæны уырдыгæй? (Cy fækæny uyrdygæj?) - Сколько стоит проезд?
  • Мæн фæнды ацы адресмæ (Mæn fændy acy adresmæ) - Мне нужно по этому адресу

  🚕 Диалог с таксистом:
  - Салам! Цы фæкæны уырдыгæй?
  - 500 рублей.
  - Хорз, ацæуæм!
  ''',
              ),
              QuizBlock(
                title: 'Что означает "Такси æвæрд кæм ис?"',
                choices: [
                  'Сколько стоит такси?',
                  'Где стоянка такси?',
                  'Вызовите такси',
                  'Я еду на такси'
                ],
                correctChoiceIndices: [1],
                allowMultiple: false,
              ),
              TextInputBlock(
                title: 'Как спросить "Где находится аэропорт?" по-осетински?',
                correctAnswer: 'аэропорт кæм ис',
                caseSensitive: false,
              ),
            ],
          ),
          Lesson(
            title: 'В ресторане и кафе',
            description: 'Учимся заказывать еду',
            blocks: [
              TheoryBlock(
                title: 'Меню и заказ 🍽️',
                contentType: ContentType.text,
                content: '''
  Осетинская кухня и заказ еды:

  Национальные блюда:
  • Фыджын (Fydžyn) - осетинский пирог с мясом
  • Уалибах (Ualibax) - пирог с сыром
  • Цахтон (Caxton) - пирог с капустой
  • Дзыкка (Dzykkа) - мамалыга
  • Цывзы (Cyvzy) - рассол

  Фразы для заказа:
  • Меню кæм ис? (Menu kæm is?) - Где меню?
  • Æз хъæуы... (Æz qæuy...) - Я хочу...
  • Цы фæкæны? (Cy fækæny?) - Сколько стоит?
  • Чек, фæлæ... (Ček, fælæ...) - Счет, пожалуйста

  📝 Пример заказа:
  - Салам! Æз хъæуы фыджын
  - Хорз! Исты æрвыстон дар?
  - О, цахтон дæр
  - Цы фæкæны ай?
  - 800 рублей
  ''',
              ),
              QuizBlock(
                title: 'Какой пирог с сыром?',
                choices: ['Фыджын', 'Уалибах', 'Цахтон', 'Дзыкка'],
                correctChoiceIndices: [1],
                allowMultiple: false,
              ),
              TrueFalseBlock(
                title: 'Фыджын - это осетинский пирог с мясом',
                correctAnswer: true,
              ),
            ],
          ),
        ],
      ),
    ];
  // final List<Course> _courses = [
  //   // ПОПУЛЯРНОЕ
  //   Course(
  //     name: 'Разговорный осетинский язык',
  //     description:
  //         'Базовый курс для начинающих. Научитесь говорить на основные темы: семья, еда, погода, работа.',
  //     rating: 4.9,
  //     author: 'Мадина Дзарахохова',
  //     category: 'Популярное',
  //     urlPhoto: "https://alpindustria.ru/UserFiles/Image/IMG_5372.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинский алфавит и фонетика',
  //     description:
  //         'Изучите буквы, звуки и правильное произношение. 44 буквы осетинского алфавита.',
  //     rating: 4.8,
  //     author: 'Сослан Хабалов',
  //     category: 'Популярное',
  //     urlPhoto: "https://a.d-cd.net/AFsBdNI-oLjuEU6v8DseCnkB_8U-1920.jpg",
  //   ),
  //   Course(
  //     name: 'Грамматика осетинского языка',
  //     description:
  //         'Падежи, времена, склонения. Полный разбор грамматических правил с примерами.',
  //     rating: 4.7,
  //     author: 'Алина Техова',
  //     category: 'Популярное',
  //     urlPhoto:
  //         "https://ic.pics.livejournal.com/mg5642/66429722/1855716/1855716_original.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинский для путешествий',
  //     description: 'Фразы и выражения для туристов в Северной и Южной Осетии.',
  //     rating: 4.6,
  //     author: 'Георгий Дзугаев',
  //     category: 'Популярное',
  //     urlPhoto: "https://photocentra.ru/images/main107/1073032_main.jpg",
  //   ),

  //   // НОВОЕ
  //   Course(
  //     name: 'Современный осетинский язык',
  //     description:
  //         'Новые слова, интернет-лексика, молодежный сленг. Актуальные разговорные темы 2024-2025.',
  //     rating: 4.9,
  //     author: 'Диана Караева',
  //     category: 'Новое',
  //     urlPhoto: "https://a.d-cd.net/9doXPujbJ0RFe8wEF7RStcWNNZA-1920.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинский в TikTok и соцсетях',
  //     description:
  //         'Как говорить на осетинском в интернете. Создание контента на родном языке.',
  //     rating: 4.8,
  //     author: 'Алан Гагиев',
  //     category: 'Новое',
  //     urlPhoto:
  //         "https://static.tildacdn.com/tild3362-3564-4366-a637-366263366537/IMG_0258-1.jpg",
  //   ),
  //   Course(
  //     name: 'Деловой осетинский язык',
  //     description:
  //         'Ведение переговоров, деловая переписка, официальные документы на осетинском.',
  //     rating: 4.7,
  //     author: 'Лариса Дзантиева',
  //     category: 'Новое',
  //     urlPhoto: "https://a.d-cd.net/eaeexzpJABAkaNB5CKjCrtt4BCs-1920.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинские дигорские говоры',
  //     description:
  //         'Изучение дигорского диалекта. Отличия от иронского, особенности произношения.',
  //     rating: 4.8,
  //     author: 'Чермен Бестаев',
  //     category: 'Новое',
  //     urlPhoto:
  //         "https://vanlife-travel.ru/wp-content/uploads/2024/11/v-gorah-osetii-2048x1365.jpg",
  //   ),

  //   // ЛУЧШЕЕ
  //   Course(
  //     name: 'Осетинский язык: от А до Я',
  //     description:
  //         'Полный курс обучения с нуля до свободного владения. 100+ уроков, практика, тесты.',
  //     rating: 5.0,
  //     author: 'Залина Гаглоева',
  //     category: 'Лучшее',
  //     urlPhoto: "https://photocentra.ru/images/main120/1202132_main.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинская литература и фольклор',
  //     description:
  //         'Изучение языка через нартский эпос, стихи Коста Хетагурова и современные тексты.',
  //     rating: 4.9,
  //     author: 'Фатима Царикаева',
  //     category: 'Лучшее',
  //     urlPhoto: "https://photocentra.ru/images/main117/1176131_main.jpg",
  //   ),
  //   Course(
  //     name: 'Мастер-класс: говорим как носитель',
  //     description:
  //         'Интонации, акценты, разговорные обороты. Убираем акцент и говорим естественно.',
  //     rating: 4.9,
  //     author: 'Таймураз Бекоев',
  //     category: 'Лучшее',
  //     urlPhoto: "https://f.otzyv.ru/f/20/06/216609/24/19082408275898562124.jpg",
  //   ),
  //   Course(
  //     name: 'Осетинский для детей и родителей',
  //     description:
  //         'Семейный курс. Игры, песни, диалоги для изучения языка всей семьей.',
  //     rating: 4.8,
  //     author: 'Марина Догузова',
  //     category: 'Лучшее',
  //     urlPhoto:
  //         "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Vladikavkaz-014.jpg/1280px-Vladikavkaz-014.jpg",
  //   ),
  // ];

  @override
  void addCourse(Course course) {
    _courses.add(course);
  }

  @override
  void addAllCourses(List<Course> courses) {
    _courses.addAll(courses);
  }

  @override
  List<Course> getAllCourses() {
    return List.unmodifiable(_courses);
  }

  @override
  Course? getCourseByIndex(int index) {
    if (index >= 0 && index < _courses.length) {
      return _courses[index];
    }
    return null;
  }

  @override
  List<Course> getCoursesByCategory(String category) {
    return _courses.where((course) => course.category == category).toList();
  }

  @override
  List<Course> getCoursesByRatingAbove(double minRating) {
    return _courses.where((course) => course.rating >= minRating).toList();
  }

  @override
  List<Course> getCoursesByAuthor(String author) {
    return _courses.where((course) => course.author == author).toList();
  }

  @override
  List<Course> searchCourses(String query) {
    return _courses.where((course) {
      return course.name.toLowerCase().contains(query.toLowerCase()) ||
          course.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  bool removeCourse(Course course) {
    return _courses.remove(course);
  }

  @override
  void clearAll() {
    _courses.clear();
  }

  @override
  List<String> getUniqueAuthors() {
    return _courses.map((c) => c.author).toSet().toList();
  }
  
  @override
  List<Course> getStartedCourses() {
    return _courses.where((course) => course.isStarted == true).toList();
  }
}
