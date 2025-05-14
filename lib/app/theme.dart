import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VpnTheme {
  ThemeData appTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryTextTheme: GoogleFonts.merriweatherSansTextTheme(),
      textTheme: GoogleFonts.merriweatherSansTextTheme(),
    );
  }
}
