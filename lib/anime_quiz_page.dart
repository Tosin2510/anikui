import 'dart:async';

import 'package:anikui/anime_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeQuizPage extends StatefulWidget {
  const AnimeQuizPage({super.key});

  @override
  State<AnimeQuizPage> createState() => _AnimeQuizPageState();
}

class _AnimeQuizPageState extends State<AnimeQuizPage> {

  List<AnimePart> questions = [];
  List<AnimePart> optionList = [];
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
    questions = List.from(availableAnime);
    questions.shuffle();
    setUpQuestion();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setUpQuestion() {
    AnimePart correctAnime = questions[currentQuestion];

    List<AnimePart> otherAnime = [];

    for (AnimePart val in availableAnime) {
      if (val.id == correctAnime.id) continue;
      otherAnime.add(val);
    }

    otherAnime.shuffle();

    optionList = [correctAnime, otherAnime[0], otherAnime[1]];
    optionList.shuffle();

    indexOfCorrectAnime = optionList.indexOf(correctAnime);

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
        questions.shuffle();
        currentQuestion = 0;
      } else {
        currentQuestion = currentQuestion + 1;
      }
      setUpQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {

    AnimePart anime = questions[currentQuestion];

    String errorMessage = '';

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
      if (indexOfPickedAnswer == indexOfCorrectAnime) {
        errorMessage = 'Correct!';
      } else {
        errorMessage = 'Not quite. The answer is ${anime.title}';
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
                      'Which anime is this?',
                      style: GoogleFonts.shipporiMincho(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2B2430),
                      ),
                    ),

                    SizedBox(height: 20,),

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

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        goToNextQuestion();
      }
    });
  }

  Widget buildOptionButtons(int index) {
     AnimePart option = optionList[index];

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
          option.title,
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