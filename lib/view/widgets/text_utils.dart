import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final TextDecoration underLine;
  TextUtils({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.underLine,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: underLine,
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
