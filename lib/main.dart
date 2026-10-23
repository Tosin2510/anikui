import 'package:anikui/anime_part.dart';
import 'package:anikui/landing_page.dart';
import 'package:anikui/words.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadWords();
    await loadAnimeParts();
    
  debugPrint(availableAnime.length.toString());
  if (availableAnime.isNotEmpty) {
    debugPrint(availableAnime[0].title);
    debugPrint(availableAnime[0].imageUrl);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anikui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8DDE2),
      ),
      home: LandingPage(),
    );
  }
}
