import 'dart:async';
import 'package:anikui/page_background.dart';
import 'package:anikui/culture_part.dart';
import 'package:flutter/material.dart';
import 'package:anikui/result_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CultureQuizPage extends StatefulWidget {
  const CultureQuizPage({super.key});

  @override
  State<CultureQuizPage> createState() => _CultureQuizPageState();
}

class _CultureQuizPageState extends State<CultureQuizPage> {

  List<CulturePart> questions = [];
  List<String> optionList = [];
  int indexOfCorrectAnswer = 0;
  int? indexOfPickedAnswer;
  bool hasAnsweredThatQuestion = false;

  int currentQuestion = 0;
  int score = 0;

  double totalSeconds = 60;
  double timeLeft = 60;
  Timer? timer;
  List<Widget> space = [];

  @override
  void initState() {
    super.initState();
    questions = List.from(availableCulture);
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
    CulturePart culture = questions[currentQuestion];

    optionList = [culture.answer, culture.wrongAnswer1, culture.wrongAnswer2];
    optionList.shuffle();

    indexOfCorrectAnswer = optionList.indexOf(culture.answer);

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return ResultPage(
              score: score,
              sectionName: 'Culture',
              playAgainPage: CultureQuizPage(),
            );
          }),
        );
      }
    });
  });
}

  void pickAnswerToQuestion(int val) {
    if (hasAnsweredThatQuestion) return;
    setState(() {
      indexOfPickedAnswer = val;
      hasAnsweredThatQuestion = true;
      if (val == indexOfCorrectAnswer) {
        score = score + 1;
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        goToNextQuestion();
      }
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
    CulturePart culture = questions[currentQuestion];

    String message = '';

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
      if (indexOfPickedAnswer == indexOfCorrectAnswer) {
        message = 'Correct! ${culture.fact}';
      } else {
        message = 'Not quite. The answer is ${culture.answer}. ${culture.fact}';
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF8DDE2),
      body: PageBackground(
        kanji: '文',
        child: SafeArea(
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
                  ],
                ),

                SizedBox(height: 18),

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
                        '文',
                        style: GoogleFonts.shipporiMincho(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFF8DDE2),
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Text(
                      'Score: $score',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 17,
                        color: Color(0xFF6B5F6E),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 18),

                Text(
                  culture.question,
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2B2430),
                  ),
                ),

                SizedBox(height: 26),

                buildOptionButtons(0),
                buildOptionButtons(1),
                buildOptionButtons(2),

                Text(
                  message,
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2B2430),
                  ),
                ),
              ]
            )
          )
        )
        )
      )
    );
  }

  Widget buildOptionButtons(int index) {
    String option = optionList[index];

    Color boxColor = Color(0xFFFFF5F7);
    Color textColor = Color(0xFF2B2430);

    if (hasAnsweredThatQuestion && index == indexOfCorrectAnswer) {
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
          ],
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