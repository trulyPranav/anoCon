import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPlacer extends StatefulWidget {
  const TextPlacer({super.key});

  @override
  State<TextPlacer> createState() => _TextPlacerState();
}

class _TextPlacerState extends State<TextPlacer> {
  final fieldTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextFormField(
            showCursor: true,
            controller: fieldTextController,
            keyboardType: TextInputType.text,
            onSaved: (String? value) {},
            textInputAction: TextInputAction.done,
            style: GoogleFonts.dotGothic16(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter your path!",
              hintStyle: GoogleFonts.dotGothic16(
                color: Colors.red
              ),
            ),
          ),
        )
      ],
    );
  }
}