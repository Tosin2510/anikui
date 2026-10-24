import 'dart:async';

import 'package:anikui/anime_character_part.dart';
import 'package:anikui/anime_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeQuestion {
  String type;
  String group;
  String imageUrl;
  String answer;
  String animeTitle;
  String description;

  AnimeQuestion({
    required this.type,
    required this.group,
    required this.imageUrl,
    required this.answer,
    required this.animeTitle,
    required this.description,
  });
}

class AnimeQuizPage extends StatefulWidget {
  const AnimeQuizPage({super.key});

  @override
  State<AnimeQuizPage> createState() => _AnimeQuizPageState();
}

class _AnimeQuizPageState extends State<AnimeQuizPage> {

  List<AnimeQuestion> questions = [];
  List<String> optionList = [];
  int indexOfCorrectAnime = 0;
  int? indexOfPickedAnswer;
  bool hasAnsweredThatQuestion = false;

  int currentQuestion = 0;

  List<Widget> space = [];
  int score = 0;

  double totalSeconds = 60;
  double timeLeft = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    buildQuestions();
    setUpQuestion();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void buildQuestions() {
    List<AnimeQuestion> animeQuestions = [];
    List<AnimeQuestion> characterQuestions = [];
    List<AnimeQuestion> descriptionQuestions = [];
    List<AnimeQuestion> episodeQuestions = [];

    if (availableAnime.length >= 3) {
      for (AnimePart val in availableAnime) {
        animeQuestions.add(
          AnimeQuestion(
            type: 'anime',
            group: 'title',
            imageUrl: val.imageUrl,
            answer: val.title,
            animeTitle: val.title,
            description: '',
          ),
        );

        if (val.description.length >= 60) {
          descriptionQuestions.add(
            AnimeQuestion(
              type: 'description',
              group: 'title',
              imageUrl: val.imageUrl,
              answer: val.title,
              animeTitle: val.title,
              description: val.description,
            ),
          );
        }

        if (val.episodes > 0) {
          episodeQuestions.add(
            AnimeQuestion(
              type: 'episodes',
              group: 'episodes',
              imageUrl: val.imageUrl,
              answer: val.episodes.toString(),
              animeTitle: val.title,
              description: '',
            ),
          );
        }
      }
    }

    List<String> differentEpisodeNumbers = [];
    for (AnimeQuestion val in episodeQuestions) {
      if (!differentEpisodeNumbers.contains(val.answer)) {
        differentEpisodeNumbers.add(val.answer);
      }
    }
    if (differentEpisodeNumbers.length < 3) {
      episodeQuestions = [];
    }

    if (availableCharacters.length >= 3) {
      for (AnimeCharacterPart val in availableCharacters) {
        characterQuestions.add(
          AnimeQuestion(
            type: 'character',
            group: 'character',
            imageUrl: val.imageUrl,
            answer: val.name,
            animeTitle: val.animeTitle,
            description: '',
          ),
        );
      }
    }

    List<List<AnimeQuestion>> groups = [
      animeQuestions,
      characterQuestions,
      descriptionQuestions,
      episodeQuestions,
    ];

    for (List<AnimeQuestion> group in groups) {
      group.shuffle();
    }

    questions = [];
    String lastType = '';

    while (true) {
      List<List<AnimeQuestion>> stillHaveQuestions = [];
      for (List<AnimeQuestion> group in groups) {
        if (group.isNotEmpty) {
          stillHaveQuestions.add(group);
        }
      }

      if (stillHaveQuestions.isEmpty) break;

      List<List<AnimeQuestion>> differentType = [];
      for (List<AnimeQuestion> group in stillHaveQuestions) {
        if (group.last.type != lastType) {
          differentType.add(group);
        }
      }

      if (differentType.isNotEmpty) {
        stillHaveQuestions = differentType;
      }

      stillHaveQuestions.shuffle();
      AnimeQuestion picked = stillHaveQuestions[0].removeLast();
      questions.add(picked);
      lastType = picked.type;
    }
  }

  void setUpQuestion() {
    AnimeQuestion correctQuestion = questions[currentQuestion];

    List<String> otherAnswers = [];

    for (AnimeQuestion val in questions) {
      if (val.group != correctQuestion.group) continue;
      if (val.answer == correctQuestion.answer) continue;
      if (otherAnswers.contains(val.answer)) continue;
      otherAnswers.add(val.answer);
    }

    otherAnswers.shuffle();

    optionList = [correctQuestion.answer, otherAnswers[0], otherAnswers[1]];
    optionList.shuffle();

    indexOfCorrectAnime = optionList.indexOf(correctQuestion.answer);

    indexOfPickedAnswer = null;
    hasAnsweredThatQuestion = false;
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), (time) {
      setState(() {
        timeLeft = timeLeft - 0.1;
        if (timeLeft <= 0) {
          timeLeft = 0;
          time.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestion == questions.length - 1) {
        buildQuestions();
        currentQuestion = 0;
      } else {
        currentQuestion = currentQuestion + 1;
      }
      setUpQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {

    AnimeQuestion anime = questions[currentQuestion];

    String errorMessage = '';
    String heading = 'Which anime is this?';
    double headingSize = 32;

    if (anime.type == 'character') {
      heading = 'Who is this character?';
    }

    if (anime.type == 'episodes') {
      heading = 'How many episodes does ${anime.animeTitle} have?';
      headingSize = 24;
    }

    space = [];
    int spaceFilled = (timeLeft / (totalSeconds / 10)).ceil();

    for (int val = 0; val < 10; val++) {
      bool isFilled = val < spaceFilled;
      space.add(
        Expanded(
          child: Container(
            height: 12,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: isFilled ? (spaceFilled <= 2 ? Color(0xFFC23B3B) : Color(0xFF2B2430)) : Colors.transparent,
              border: Border.all(color: Color(0xFF2B2430), width: 1.5),
            ),
          ),
        ),
      );
    }

    if (hasAnsweredThatQuestion) {
      bool isCorrect = indexOfPickedAnswer == indexOfCorrectAnime;

      if (anime.type == 'character') {
        if (isCorrect) {
          errorMessage = 'Correct... From ${anime.animeTitle}';
        } else {
          errorMessage = 'No. This is ${anime.answer} from ${anime.animeTitle}';
        }
      } else if (anime.type == 'episodes') {
        if (isCorrect) {
          errorMessage = 'Correct ${anime.answer} episodes';
        } else {
          errorMessage = 'No...${anime.animeTitle} has ${anime.answer} episodes';
        }
      } else {
        if (isCorrect) {
          errorMessage = 'Correct!';
        } else {
          errorMessage = 'No...The answer is ${anime.answer}';
        }
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF8DDE2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Color(0xFF2B2430)),
                    ),
                    SizedBox(width: 6),
                    Expanded(child: Row(children: space)),
                  ],),

                  SizedBox(height: 18,),

                  Row(
                    children: [
                      Container(
                      width: 46,
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFC23B3B),
                        borderRadius: BorderRadius.circular(6),
                      ),

                      child: Text(
                         '漫',
                        style: GoogleFonts.shipporiMincho(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFF8DDE2),
                        )
                       )
                      ),

                      SizedBox(width: 12,),

                      Text(
                        'Score: $score',
                        style: GoogleFonts.zenMaruGothic(
                        fontSize: 17,
                        color: Color(0xFF6B5F6E),
                      ),
                      )
                    ]
                  ),

                  SizedBox(height: 18,),

                  Text(
                    heading,
                    style: GoogleFonts.shipporiMincho(
                      fontSize: headingSize,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2B2430),
                    ),
                  ),

                  SizedBox(height: 20,),

                  if (anime.type == 'description')
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF5F7),
                        border: Border.all(color: Color(0xFF2B2430), width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF2B2430),
                            offset: Offset(4, 4),
                            blurRadius: 0,
                          ),
                        ]
                      ),

                      child: Text(
                        anime.description,
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 16,
                          color: Color(0xFF2B2430),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: 200,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF5F7),
                      border: Border.all(color: Color(0xFF2B2430), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF2B2430),
                          offset: Offset(4, 4),
                          blurRadius: 0,
                        ),
                        
                      ]
                    ),

                    child: Image.network(
                      anime.imageUrl,
                      fit: BoxFit.contain,

                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF2B2430),
                          ),
                        );
                      },

                      errorBuilder: (context, error, value) {
                        return Center(
                          child: Text(
                            '絵',
                            style: GoogleFonts.shipporiMincho(
                              fontSize: 64,
                              color: Color(0xFFEFC4CD),
                            ),
                          )
                        );
                      }
                    )
                    ),

                  SizedBox(height: 26,),

                  buildOptionButtons(0),
                  buildOptionButtons(1),
                  buildOptionButtons(2),

                  Text(
                    errorMessage,
                    style: GoogleFonts.zenMaruGothic(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2B2430),
                  ),
                  )
              ]
            )
          )
        )
      ),
    );
  }

  void pickAnswerToQuestion(int val) {
    if (hasAnsweredThatQuestion) return;
    setState(() {

      indexOfPickedAnswer = val;
      hasAnsweredThatQuestion = true;
      if (val == indexOfCorrectAnime) {
        score = score + 1;
      }
    });

    int waitSeconds = 1;
    if (questions[currentQuestion].type == 'character') {
      waitSeconds = 2;
    }

    Future.delayed(Duration(seconds: waitSeconds), () {
      if (mounted) {
        goToNextQuestion();
      }
    });
  }

  Widget buildOptionButtons(int index) {
     String option = optionList[index];

     Color boxColor = Color(0xFFFFF5F7);
     Color textColor = Color(0xFF2B2430);

      if (hasAnsweredThatQuestion && index == indexOfCorrectAnime) {
      boxColor = Color(0xFF5B8C5A);
      textColor = Colors.white;

    } else if (hasAnsweredThatQuestion && indexOfPickedAnswer == index) {
      boxColor = Color(0xFFC23B3B);
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: () {
        pickAnswerToQuestion(index);
      },

      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 14),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Color(0xFF2B2430), width: 2),
          boxShadow: [
             BoxShadow(
              color: Color(0xFF2B2430),
              offset: Offset(3, 3),
              blurRadius: 0,
            ),
          ]
        ),

        child: Text(
          option,
          style: GoogleFonts.zenMaruGothic(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        )
      )
    );
  }
}