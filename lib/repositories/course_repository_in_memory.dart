import 'package:flutter_ossetian_learning_app/models/course.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';

class CourseRepositoryInMemory extends AbstractCourseRepository {
  CourseRepositoryInMemory();

  final List<Course> _courses = [
    // ПОПУЛЯРНОЕ
    Course(
      name: 'Разговорный осетинский язык',
      description:
          'Базовый курс для начинающих. Научитесь говорить на основные темы: семья, еда, погода, работа.',
      rating: 4.9,
      author: 'Мадина Дзарахохова',
      category: 'Популярное',
      urlPhoto: "https://alpindustria.ru/UserFiles/Image/IMG_5372.jpg",
    ),
    Course(
      name: 'Осетинский алфавит и фонетика',
      description:
          'Изучите буквы, звуки и правильное произношение. 44 буквы осетинского алфавита.',
      rating: 4.8,
      author: 'Сослан Хабалов',
      category: 'Популярное',
      urlPhoto: "https://a.d-cd.net/AFsBdNI-oLjuEU6v8DseCnkB_8U-1920.jpg",
    ),
    Course(
      name: 'Грамматика осетинского языка',
      description:
          'Падежи, времена, склонения. Полный разбор грамматических правил с примерами.',
      rating: 4.7,
      author: 'Алина Техова',
      category: 'Популярное',
      urlPhoto:
          "https://ic.pics.livejournal.com/mg5642/66429722/1855716/1855716_original.jpg",
    ),
    Course(
      name: 'Осетинский для путешествий',
      description: 'Фразы и выражения для туристов в Северной и Южной Осетии.',
      rating: 4.6,
      author: 'Георгий Дзугаев',
      category: 'Популярное',
      urlPhoto: "https://photocentra.ru/images/main107/1073032_main.jpg",
    ),

    // НОВОЕ
    Course(
      name: 'Современный осетинский язык',
      description:
          'Новые слова, интернет-лексика, молодежный сленг. Актуальные разговорные темы 2024-2025.',
      rating: 4.9,
      author: 'Диана Караева',
      category: 'Новое',
      urlPhoto: "https://a.d-cd.net/9doXPujbJ0RFe8wEF7RStcWNNZA-1920.jpg",
    ),
    Course(
      name: 'Осетинский в TikTok и соцсетях',
      description:
          'Как говорить на осетинском в интернете. Создание контента на родном языке.',
      rating: 4.8,
      author: 'Алан Гагиев',
      category: 'Новое',
      urlPhoto:
          "https://static.tildacdn.com/tild3362-3564-4366-a637-366263366537/IMG_0258-1.jpg",
    ),
    Course(
      name: 'Деловой осетинский язык',
      description:
          'Ведение переговоров, деловая переписка, официальные документы на осетинском.',
      rating: 4.7,
      author: 'Лариса Дзантиева',
      category: 'Новое',
      urlPhoto: "https://a.d-cd.net/eaeexzpJABAkaNB5CKjCrtt4BCs-1920.jpg",
    ),
    Course(
      name: 'Осетинские дигорские говоры',
      description:
          'Изучение дигорского диалекта. Отличия от иронского, особенности произношения.',
      rating: 4.8,
      author: 'Чермен Бестаев',
      category: 'Новое',
      urlPhoto:
          "https://vanlife-travel.ru/wp-content/uploads/2024/11/v-gorah-osetii-2048x1365.jpg",
    ),

    // ЛУЧШЕЕ
    Course(
      name: 'Осетинский язык: от А до Я',
      description:
          'Полный курс обучения с нуля до свободного владения. 100+ уроков, практика, тесты.',
      rating: 5.0,
      author: 'Залина Гаглоева',
      category: 'Лучшее',
      urlPhoto: "https://photocentra.ru/images/main120/1202132_main.jpg",
    ),
    Course(
      name: 'Осетинская литература и фольклор',
      description:
          'Изучение языка через нартский эпос, стихи Коста Хетагурова и современные тексты.',
      rating: 4.9,
      author: 'Фатима Царикаева',
      category: 'Лучшее',
      urlPhoto: "https://photocentra.ru/images/main117/1176131_main.jpg",
    ),
    Course(
      name: 'Мастер-класс: говорим как носитель',
      description:
          'Интонации, акценты, разговорные обороты. Убираем акцент и говорим естественно.',
      rating: 4.9,
      author: 'Таймураз Бекоев',
      category: 'Лучшее',
      urlPhoto: "https://f.otzyv.ru/f/20/06/216609/24/19082408275898562124.jpg",
    ),
    Course(
      name: 'Осетинский для детей и родителей',
      description:
          'Семейный курс. Игры, песни, диалоги для изучения языка всей семьей.',
      rating: 4.8,
      author: 'Марина Догузова',
      category: 'Лучшее',
      urlPhoto:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Vladikavkaz-014.jpg/1280px-Vladikavkaz-014.jpg",
    ),
  ];

  void addCourse(Course course) {
    _courses.add(course);
  }

  void addAllCourses(List<Course> courses) {
    _courses.addAll(courses);
  }

  List<Course> getAllCourses() {
    return List.unmodifiable(_courses);
  }

  Course? getCourseByIndex(int index) {
    if (index >= 0 && index < _courses.length) {
      return _courses[index];
    }
    return null;
  }

  List<Course> getCoursesByCategory(String category) {
    return _courses.where((course) => course.category == category).toList();
  }

  List<Course> getCoursesByRatingAbove(double minRating) {
    return _courses.where((course) => course.rating >= minRating).toList();
  }

  List<Course> getCoursesByAuthor(String author) {
    return _courses.where((course) => course.author == author).toList();
  }

  List<Course> searchCourses(String query) {
    return _courses.where((course) {
      return course.name.toLowerCase().contains(query.toLowerCase()) ||
          course.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  bool removeCourse(Course course) {
    return _courses.remove(course);
  }

  void clearAll() {
    _courses.clear();
  }

  List<String> getUniqueAuthors() {
    return _courses.map((c) => c.author).toSet().toList();
  }
  
  @override
  List<Course> getStartedCourses() {
    return _courses.where((course) => course.isStarted == true).toList();
  }
}
