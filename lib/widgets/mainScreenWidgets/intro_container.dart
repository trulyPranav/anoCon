import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroContainer extends StatelessWidget {
  const IntroContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "anoCon!",
              textAlign: TextAlign.left,
              style: GoogleFonts.metalMania(
                fontSize: 32,
                color: Colors.orange
              ),
            ),
            Text(
              "Talk without Fear!",
              textAlign: TextAlign.left,
              style: GoogleFonts.metalMania(
                fontSize: 22,
                color: Colors.orange
              ),
            ),
          ],
        ),
      ),
    );
  }
}