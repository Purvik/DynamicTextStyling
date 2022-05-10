import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum EnumFontStyle { normal, italic }

class TextFormattingResources {
  static TextStyle getTextStyle(int index) {
    late TextStyle _textStyle;
    switch (index) {
      case 0:
        _textStyle = GoogleFonts.oswald();
        break;
      case 1:
        _textStyle = GoogleFonts.macondo();
        break;
      case 2:
        _textStyle = GoogleFonts.anton();
        break;
      case 3:
        _textStyle = GoogleFonts.lobster();
        break;
      default:
        _textStyle = GoogleFonts.roboto();
        break;
    }
    return _textStyle;
  }

  static FontStyle getFontStyle(EnumFontStyle fontStyle) {
    switch (fontStyle) {
      case EnumFontStyle.normal:
        return FontStyle.normal;
      case EnumFontStyle.italic:
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }

  static String getFontStyleLabel(EnumFontStyle fontStyle) {
    switch (fontStyle) {
      case EnumFontStyle.italic:
        return "I";
      default:
        return "N";
    }
  }
}
