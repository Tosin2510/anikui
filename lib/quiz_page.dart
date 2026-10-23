import 'dart:async';

import 'package:anikui/words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentQuestion = 0;
  int totalQuestions = 5;

  double totalSeconds = 60;
  double timeLeft = 60;

  List<Word> optionList = [];
  int indexOfCorrectWord = 0;
  int? indexOfPickedAnswer;
  bool hasAnsweredThatQuestion = false;

  List<Word> questions = [];

  Timer? timer;
  List<Widget> space = [];

    @override
    void initState() {
      super.initState();
      List<Word> wordsWithPictures = allAvailableWords.where((w) => w.hasImage).toList();
      List<Word> wordsWithoutPictures = allAvailableWords.where((w) => !w.hasImage).toList();
      wordsWithPictures.shuffle();
      wordsWithoutPictures.shuffle();

      questions = [];
      questions.addAll(wordsWithPictures.take(3));
      questions.addAll(wordsWithoutPictures.take(totalQuestions - questions.length));
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
      Word correctWord = questions[currentQuestion];
      bool verb = correctWord.english.startsWith('to ');

      List<Word> otherWords = [];

      for (Word val in allAvailableWords) {
        bool isWordAVerb = val.english.startsWith('to ');
        if (isWordAVerb != verb) continue;

        if (val.japanese == correctWord.japanese || val.english == correctWord.english) continue;
        otherWords.add(val);
      }

      otherWords.shuffle();

      optionList = [correctWord, otherWords[0], otherWords[1]];
      optionList.shuffle();

      indexOfCorrectWord = optionList.indexOf(correctWord);

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
          }
        });
      });
    }

    void pickAnswerToQuestion(int val) {
      if (hasAnsweredThatQuestion) return;
      setState(() {
        indexOfPickedAnswer = val;
        hasAnsweredThatQuestion = true;
      });
    }

    void goToNextQuestion() {
      setState(() {
        currentQuestion = currentQuestion + 1;
        setUpQuestion();
      });
    }

  @override
  Widget build(BuildContext context) {
    Word word = questions[currentQuestion];

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
      if (indexOfPickedAnswer == indexOfCorrectWord) {
        message = 'Correct!';
      } else {
        message = 'Not quite. The answer is ${word.japanese} (${word.romanji})';
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
                  ],
                ),

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
                         '問',
                        style: GoogleFonts.shipporiMincho(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFF8DDE2),
                        ),
                      ),
                    ),

                    SizedBox(width: 12,),

                    Text(
                      '${currentQuestion + 1} of $totalQuestions',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 17,
                        color: Color(0xFF6B5F6E),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 18),

                Text(
                  'How do you say',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 18,
                    color: Color(0xFF6B5F6E),
                  ),
                ),
                 Text(
                  '“${word.english}”',
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2B2430),
                  ),
                ),

                Text(
                  'in Japanese?',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 18,
                    color: Color(0xFF6B5F6E),
                  ),
                ),
 
                SizedBox(height: 20),

                if (word.hasImage)
                Container(
                  width: double.infinity,
                  height: 190,
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

                    child: Image.asset(
                      word.pathToImage,
                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            '絵',
                            style: GoogleFonts.shipporiMincho(
                              fontSize: 64,
                              color: Color(0xFFEFC4CD),
                            ),
                          ),
                        );
                      }
                    )
                ),

                if (word.hasImage)
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

                SizedBox(height: 12),

                if (hasAnsweredThatQuestion && currentQuestion < totalQuestions - 1)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: goToNextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2B2430),
                        foregroundColor: Color(0xFFF8DDE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: GoogleFonts.zenMaruGothic(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ]
            )
          )
        )
      )
    );
  }

  Widget buildOptionButtons(int index) {
    Word option = optionList[index];

    Color boxColor = Color(0xFFFFF5F7);
    Color textColor = Color(0xFF2B2430);
    Color romajiColor = Color(0xFF6B5F6E);

    if (hasAnsweredThatQuestion && index == indexOfCorrectWord) {
      boxColor = Color(0xFF5B8C5A);
      textColor = Colors.white;
      romajiColor = Colors.white;

    } else if (hasAnsweredThatQuestion && indexOfPickedAnswer == index) {
      boxColor = Color(0xFFC23B3B);
      textColor = Colors.white;
      romajiColor = Colors.white;
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

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            option.japanese,
              style: GoogleFonts.shipporiMincho(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
           ),

           Text(
            option.romanji,
            style: GoogleFonts.zenMaruGothic(
              fontSize: 15,
              color: romajiColor,
            ),
           )
         ]
        )
      )
    );
  }
}