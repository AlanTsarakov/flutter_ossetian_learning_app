import 'package:flutter_ossetian_learning_app/models/flashcard.dart';

class FlashcardRepository {
  final List<Flashcard> _flashcards = [
    Flashcard(
    id: '1',
    ossetianWord: 'Арфæ',
    russianWord: 'Приветствие / Благодарность',
    partOfSpeech: 'существительное',
    exampleSentence: 'Арфæ мын бакæн.',
  ),
  Flashcard(
    id: '2',
    ossetianWord: 'Хæрзбон',
    russianWord: 'До свидания / Добрый день',
    partOfSpeech: 'междометие',
    exampleSentence: 'Хæрзбон, ме ’мбал!',
  ),
  Flashcard(
    id: '3',
    ossetianWord: 'Бæрзонд',
    russianWord: 'Высокий',
    partOfSpeech: 'прилагательное',
    exampleSentence: 'Бæрзонд хох.',
  ),
  Flashcard(
    id: '4',
    ossetianWord: 'Цæуын',
    russianWord: 'Идти',
    partOfSpeech: 'глагол',
    exampleSentence: 'Æз цæуын скъоламæ.',
  ),
  Flashcard(
    id: '5',
    ossetianWord: 'Ныхас',
    russianWord: 'Слово / Речь / Разговор',
    partOfSpeech: 'существительное',
    exampleSentence: 'Ирон ныхас.',
  ),
  Flashcard(
    id: '6',
    ossetianWord: 'Рæсугъд',
    russianWord: 'Красивый',
    partOfSpeech: 'прилагательное',
    exampleSentence: 'Рæсугъд чызг.',
  ),
  Flashcard(
    id: '7',
    ossetianWord: 'Кæсын',
    russianWord: 'Читать / Смотреть',
    partOfSpeech: 'глагол',
    exampleSentence: 'Æз кæсын чиныг.',
  ),
  Flashcard(
    id: '8',
    ossetianWord: 'Æхсызгон',
    russianWord: 'Приятный / Радостный',
    partOfSpeech: 'прилагательное',
    exampleSentence: 'Æхсызгон мын у.',
  ),
  Flashcard(
    id: '9',
    ossetianWord: 'Фыссын',
    russianWord: 'Писать',
    partOfSpeech: 'глагол',
    exampleSentence: 'Фыссын писмо.',
  ),
  ];

  List<Flashcard> getAll()
  {
    return List.unmodifiable(_flashcards);
  }
}