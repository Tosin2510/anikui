import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final String sectionName;
  final Widget playAgainPage;

  const ResultPage({
    super.key,
    required this.score,
    required this.sectionName,
    required this.playAgainPage,
  });

  @override
  Widget build(BuildContext context) {
    String title = 'もう一度';
    if (score >= 5) {
      title = 'よくできました';
    }

    return Scaffold(
      backgroundColor: Color(0xFFF8DDE2),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Time's up!",
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 20,
                    color: Color(0xFF6B5F6E),
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  title,
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2B2430),
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  '$score',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFC23B3B),
                  ),
                ),

                Text(
                  'correct in $sectionName',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 17,
                    color: Color(0xFF6B5F6E),
                  ),
                ),

                SizedBox(height: 36),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return playAgainPage;
                        })
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B2430),
                      foregroundColor: Color(0xFFF8DDE2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Play again',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back home',
                    style: GoogleFonts.zenMaruGothic(
                      fontSize: 17,
                      color: Color(0xFF2B2430),
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
}