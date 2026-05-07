class Flashcard {
  final String id;
  final String ossetianWord;
  final String russianWord;

  String? urlAudio;
  String? exampleSentence;
  String? partOfSpeech;

  Flashcard({
    required this.id,
    required this.ossetianWord,
    required this.russianWord,
    this.urlAudio,
    this.exampleSentence,
    this.partOfSpeech,
  });
}
