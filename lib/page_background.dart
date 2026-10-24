import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageBackground extends StatelessWidget {
  final Widget child;
  final String kanji;

  const PageBackground({
    super.key,
    required this.child,
    required this.kanji,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -120,
          right: -120,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFF3CFD6),
              shape: BoxShape.circle,
            )
          )
        ),

        Positioned(
          bottom: -40,
          left: -20,
          child: Text(
            kanji,
            style: GoogleFonts.shipporiMincho(
              fontSize: 220,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF3CFD6),
            ),
          )
        ),
        child,
      ]
    );
  }
}