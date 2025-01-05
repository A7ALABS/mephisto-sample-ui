import 'package:flutter/material.dart';

const Color white = Color(0xFFF4F8FB);
const Color black = Color(0xFF192126);
const Color primaryBgColor = Colors.black;
const Color primaryColor = Color(0xFFFE6A4C);
const Color backgroundColor = Color(0xFF1A1A1E);
const Color brightBlue = Color(0xFF487BE3);
const Color blue = Color(0xFF2D55CC);
const Color opBrightBlue = Color.fromRGBO(72, 123, 227, 0.2);
const Color opBlue = Color.fromRGBO(45, 85, 204, 0.2);
const Color neutralWhite = Color(0xFFFAFCFF);
const Color neutralBgColor = Color(0xFF1A1A1E);
const Color neutralBgColor2 = Color(0xFF26262C);
const Color neutralLines = Color(0xFF3A3A40);
const Color neutralIconCaption = Color(0xFF939396);
const Color opNeutralLines = Color.fromRGBO(58, 58, 64, 0.8);

@immutable
class ColorExtension extends ThemeExtension<ColorExtension> {
  const ColorExtension({
    required this.primaryBgColor,
    required this.primaryColor,
    required this.white,
    required this.black,
    required this.brightBlue,
    required this.neutralWhite,
    required this.neutralBgColor,
    required this.neutralBgColor2,
    required this.neutralLines,
    required this.neutralIconCaption,
    required this.backgroundColor,
    required this.opNeutralLines,
  });
  final Color? primaryBgColor;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? white;
  final Color? black;

  final Color? brightBlue;

  final Color? neutralWhite;
  final Color? neutralBgColor;
  final Color? neutralBgColor2;
  final Color? neutralLines;
  final Color? neutralIconCaption;
  final Color? opNeutralLines;

  @override
  ColorExtension copyWith({Color? primaryBgColor}) {
    return ColorExtension(
      primaryBgColor: primaryBgColor,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      white: white,
      black: black,
      brightBlue: brightBlue,
      neutralWhite: neutralWhite,
      neutralBgColor: neutralBgColor,
      neutralBgColor2: neutralBgColor2,
      neutralLines: neutralLines,
      opNeutralLines: opNeutralLines,
      neutralIconCaption: neutralIconCaption,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other is! ColorExtension) {
      return this;
    }
    return ColorExtension(
      primaryBgColor: Color.lerp(primaryBgColor, other.primaryBgColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      white: Color.lerp(white, other.white, t),
      black: Color.lerp(black, other.black, t),
      brightBlue: Color.lerp(brightBlue, other.brightBlue, t),
      neutralWhite: Color.lerp(neutralWhite, other.neutralWhite, t),
      neutralBgColor: Color.lerp(neutralBgColor, other.neutralBgColor, t),
      neutralBgColor2: Color.lerp(neutralBgColor2, other.neutralBgColor2, t),
      neutralLines: Color.lerp(neutralLines, other.neutralLines, t),
      neutralIconCaption:
          Color.lerp(neutralIconCaption, other.neutralIconCaption, t),
      opNeutralLines: Color.lerp(opNeutralLines, other.opNeutralLines, t),
    );
  }
}

var colorExtension = const ColorExtension(
  white: white,
  black: black,
  primaryBgColor: primaryBgColor,
  primaryColor: primaryColor,
  backgroundColor: backgroundColor,
  brightBlue: brightBlue,
  neutralWhite: neutralWhite,
  neutralBgColor: neutralBgColor,
  neutralBgColor2: neutralBgColor2,
  neutralLines: neutralLines,
  neutralIconCaption: neutralIconCaption,
  opNeutralLines: opNeutralLines,
);

var colorExtensionLight = const ColorExtension(
  white: white,
  black: black,
  primaryBgColor: primaryBgColor,
  primaryColor: primaryColor,
  backgroundColor: backgroundColor,
  brightBlue: brightBlue,
  neutralWhite: neutralWhite,
  neutralBgColor: neutralBgColor,
  neutralBgColor2: neutralBgColor2,
  neutralLines: neutralLines,
  neutralIconCaption: neutralIconCaption,
  opNeutralLines: opNeutralLines,
);
