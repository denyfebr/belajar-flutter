import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFont{
  static TextStyle paragraph = GoogleFonts.notoSans(
    fontSize: 14,
  );
  static TextStyle heading1 = GoogleFonts.nunito(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );
  static TextStyle heading2 = GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle heading3 = GoogleFonts.nunito(
      fontSize: 14,
      fontWeight: FontWeight.w400
  );
}