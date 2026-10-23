import 'dart:async';

import 'package:anikui/quiz_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isOnline = false;
  StreamSubscription<List<ConnectivityResult>>? sub;

  @override
  void initState() {
    super.initState();
    checkIfDeviceHasInternet();
    sub = Connectivity().onConnectivityChanged.listen((results) {
      setState(() {
        isOnline = !results.contains(ConnectivityResult.none);
      });
    });
  }

    @override
    void dispose() {
      sub?.cancel();
      super.dispose();
    }

  void checkIfDeviceHasInternet() async {
     List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    if (!mounted) return;
    setState(() {
      isOnline = !results.contains(ConnectivityResult.none);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8DDE2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'こんにちは',
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2B2430),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pick a section to explore',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 17,
                    color: Color(0xFF6B5F6E),
                  ),
                ),

                SizedBox(height: 28,),

                quizCategoryCard(context, '言', 'Vocabulary', 'How do you say it in Japanese?', true),
                quizCategoryCard(context, '漫', 'Anime', 'Questions about anime', isOnline, inactiveText: 'Connect to the internet to play'),
                quizCategoryCard(context, '食', 'Food', 'Name the Japanese dish', false),
                quizCategoryCard(context, '文', 'Culture', 'Japanese customs and traditions', false),
              ]
            )
          )
          )
        )
      )
    );
  }
}

Widget quizCategoryCard(
  BuildContext context,
  String japaneseCharacter,
  String englishTitle,
  String description,
  bool isActive, {
  String? inactiveText,
  }) {
  return GestureDetector(
    onTap: () {
      if (isActive) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return QuizPage();
          }
          )
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(inactiveText ?? '$englishTitle is coming soon')),
        );
      }
    },

    child: Opacity(
      opacity: isActive ? 1.0 : 0.6,
      child: Container(
        width: double.infinity,
          margin: EdgeInsets.only(bottom: 18),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color(0xFFFFF5F7),
            
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF2B2430), width: 2),

            boxShadow: [
              BoxShadow(
                color: Color(0xFF2B2430),
                offset: Offset(4, 4),
                blurRadius: 0,
              )
            ]
          ),

          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFC23B3B),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Text(
                  japaneseCharacter,
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFF8DDE2),
                )
              )
              ),

              SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      englishTitle,
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2B2430),
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      isActive? description : 'Coming soon',
                      style: GoogleFonts.zenMaruGothic(
                        fontSize: 14,
                        color: Color(0xFF6B5F6E),
                      ),
                    )
                  ]
                )
              ),

              Icon(Icons.chevron_right, color: Color(0xFF2B2430))
            ]
          )
      )
    )
  );
}
