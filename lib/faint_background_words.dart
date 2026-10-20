import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> faintbackgroundWords = [
  '桜',
  'さくら',
  '猫',
  'ラーメン',
  '侍',
  '夢',
  'アニメ',
  '漫画',
  '寿司',
  '空',
  '友',
  '愛',
  '祭',
  '忍者',
];

class FaintBackgroundWords extends StatelessWidget {
  const FaintBackgroundWords({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 80,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),

      itemBuilder: (context, value) {
        int rowVal = value ~/ 4;
        int colVal = value % 4;

        if ((rowVal + colVal) % 2 == 0) {
          return SizedBox();
        }

        String individualWord = faintbackgroundWords[value % faintbackgroundWords.length];

        double tiltAngle = ((value % 5) - 2) * 0.1;

        return Center(
          child: Transform.rotate(
            angle: tiltAngle,
            child: Padding(
              padding: EdgeInsets.all(10),

              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  individualWord,
                  style: GoogleFonts.shipporiMincho(
                    fontSize: 24 + (value % 3) * 6,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEFC4CD),
                  ),
                ),
              )
            )
          )
        );
      }
    ); 
  } 
}