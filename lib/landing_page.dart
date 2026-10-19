import 'package:anikui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double appNameOpacity = 0.0;
  double additionalOpacity = 0.0;
  double redStampInLandingPageOpacity = 0.0;
  double redStampScale = 1.7;
  bool hasUserLeftLandingPage = false;
  @override
  void initState() {
    super.initState();

  Future.delayed(Duration(milliseconds: 300), () {
    if (!mounted) return;
    setState(() {
      appNameOpacity = 1.0;
    });
  });

  Future.delayed(Duration(milliseconds: 1200), () {
    if (!mounted) return;
    setState(() {
      additionalOpacity = 1.0;
    });
  });

  Future.delayed(Duration(milliseconds: 1900), () {
    if (!mounted) return;
    setState(() {
      redStampInLandingPageOpacity = 1.0;
      redStampScale = 1.0;
    });
  });

  Future.delayed(Duration(milliseconds: 3500), () {
    if (hasUserLeftLandingPage) return;
    if (!mounted) return;
    hasUserLeftLandingPage = true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return HomePage();
      })
    );
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (hasUserLeftLandingPage) return;
          if (hasUserLeftLandingPage) return;
          hasUserLeftLandingPage = true;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return HomePage();
            })
          );
        },
        child: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 5,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Stack(
                   children: [
                    AnimatedOpacity(
                      opacity: appNameOpacity,
                      duration: Duration(milliseconds: 900),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'アニクイ',
                          style: GoogleFonts.shipporiMincho(
                            fontSize: 96,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2B2430),
                            letterSpacing: 4,
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      right: 0,
                      bottom: -30,
                      child: AnimatedOpacity(
                        opacity: redStampInLandingPageOpacity,
                        duration: Duration(milliseconds: 300),
                        
                        child: AnimatedScale(
                          scale: redStampScale,
                          duration: Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                          child: Transform.rotate(
                            angle: -0.07,
                            child: Container(
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
                                  color: Color(0xFFf8DDE2),                     
                                )
                              )
                             )
                            )
                           )
                          )
                    )
                ]
              )
            ),

            SizedBox(height: 52,),

            AnimatedOpacity(
              opacity: additionalOpacity, 
              duration: Duration(milliseconds: 700),
              child: Column(children: [
                Text(
                  'Anikui',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 26,
                    color: Color(0xFF2B2430),
                    letterSpacing: 6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Test your knowledge of Japanese',
                   style: GoogleFonts.zenMaruGothic(
                    fontSize: 15,
                    color: Color(0xFF6B5F6E)
                 ),
                )
              ],)
            ),

            Spacer(flex: 5),
            AnimatedOpacity(
              opacity: additionalOpacity,
              duration: Duration(milliseconds: 700),
              child: Text(
                '学ぶ',
                style: GoogleFonts.shipporiMincho(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF6B5F6E),
                ),
              ),
            ),

            SizedBox(height: 28),
           ]
          )
         ),         
        )
       );
  }
}