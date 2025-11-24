import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle regular(double size, {Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle semiBold(double size, {Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold(double size, {Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
}
