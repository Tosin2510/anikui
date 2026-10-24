import 'package:anikui/page_background.dart';
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
    String stamp = '頑';
    String title = 'もう一度';
    String subtitle = 'Keep practicing, you will get there';

    if (score >= 15) {
      stamp = '優';
      title = 'すばらしい';
      subtitle = 'Outstanding!';
    } else if (score >= 10) {
      stamp = '良';
      title = 'よくできました';
      subtitle = 'Well done!';
    } else if (score >= 5) {
      stamp = '可';
      title = 'いい調子';
      subtitle = 'Nice work, keep going';
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFFF8DDE2),
        body: PageBackground(
          kanji: '終',
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TIME'S UP",
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4,
                        color: Color(0xFF6B5F6E),
                      ),
                    ),

                    SizedBox(height: 20),

                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20, 36, 20, 28),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF5F7),
                            border: Border.all(
                              color: Color(0xFF2B2430),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF2B2430),
                                offset: Offset(6, 6),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.shipporiMincho(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF2B2430),
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                subtitle,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.zenMaruGothic(
                                  fontSize: 15,
                                  color: Color(0xFF6B5F6E),
                                ),
                              ),

                              SizedBox(height: 20),

                              Container(
                                height: 2,
                                color: Color(0xFF2B2430),
                              ),

                              SizedBox(height: 16),

                              TweenAnimationBuilder<int>(
                                tween: IntTween(begin: 0, end: score),
                                duration: Duration(milliseconds: 900),
                                curve: Curves.easeOut,
                                builder: (context, value, child) {
                                  return Text(
                                    '$value',
                                    style: GoogleFonts.shipporiMincho(
                                      fontSize: 96,
                                      fontWeight: FontWeight.w800,
                                      height: 1.1,
                                      color: Color(0xFFC23B3B),
                                    ),
                                  );
                                },
                              ),

                              Text(
                                'correct in $sectionName',
                                style: GoogleFonts.zenMaruGothic(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF6B5F6E),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: -30,
                          right: 18,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 2.2, end: 1.0),
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeOutBack,
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: Transform.rotate(
                                  angle: -0.12,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFC23B3B),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Color(0xFF2B2430),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                stamp,
                                style: GoogleFonts.shipporiMincho(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFF8DDE2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return playAgainPage;
                          }),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF2B2430),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFF2B2430),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Play again',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF8DDE2),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 18),

                    GestureDetector(
                      onTap: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F7),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFF2B2430),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF2B2430),
                              offset: Offset(3, 3),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: Text(
                          'Back home',
                          style: GoogleFonts.zenMaruGothic(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2B2430),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}