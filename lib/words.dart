import 'dart:convert';

import 'package:flutter/services.dart';

class Word {
  String id;
  String japanese;
  String english;
  String romanji;
  bool hasImage;

  Word({
    required this.id,
    required this.japanese,
    required this.english,
    required this.romanji,
    required this.hasImage,
  });

  String get pathToImage {
    return 'assets/words/$id.jpg';
  }
}

List<Word> allAvailableWords = [];

List<String> wordsToSkip = [
  'well…', 'well then…', 'however', 'and', 'but', 'in that situation', 'with that...', 
  'used for comparison.', 'et cetera', 'to be', 'to do','to become', 'to differ', 'to be able to', 'to be understood',
  'to take time or money',
];

Future<void> loadWords() async {
  String text = await rootBundle.loadString('assets/data/n5.json');
  List<dynamic> data = jsonDecode(text);

  allAvailableWords = [];
  for (var val in data) {
    String english = val['english'];

    if (wordsToSkip.contains(english.toLowerCase())) {
      continue;
    }

    allAvailableWords.add(
      Word(
        id: val['id'],
        japanese: val['japanese'],
        english: val['english'],
        romanji: val['romaji'],
        hasImage: val['hasImage'],
      ),
    );
  }
}