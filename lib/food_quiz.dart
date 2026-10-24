import 'dart:async';
import 'package:anikui/page_background.dart';
import 'package:anikui/food_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodQuiz extends StatefulWidget {
  const FoodQuiz({super.key});

  @override
  State<FoodQuiz> createState() => _FoodQuizState();
}


class _FoodQuizState extends State<FoodQuiz> {

  List<FoodPart> questions = [];
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
    questions = List.from(availableFoodQuestions);
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
    FoodPart food = questions[currentQuestion];

    optionList = [food.answer, food.wrongAnswer1, food.wrongAnswer2];
    optionList.shuffle();

    indexOfCorrectAnswer = optionList.indexOf(food.answer);

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

  void pickAnswerToQuestion(int value) {
    if (hasAnsweredThatQuestion) return;
    setState(() {
      indexOfPickedAnswer = value ;
      hasAnsweredThatQuestion = true;
      if (value == indexOfCorrectAnswer) {
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
    FoodPart food = questions[currentQuestion];

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
        message = 'Correct! ${food.fact}';
      } else {
        message = 'Not quite. The answer is ${food.answer}. ${food.fact}';
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF8DDE2),
      body: PageBackground(
        kanji: '食',
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
                  ]
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
                        '食',
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

                  ]
                     ),
                    SizedBox(height: 18),

                    Text(
                      food.question,
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
                  )
                    )
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