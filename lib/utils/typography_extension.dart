import 'package:flutter/material.dart';

@immutable
class TypographyExtension extends ThemeExtension<TypographyExtension> {
  const TypographyExtension(
      {required this.headingBold,
      required this.headingLight,
      required this.headingBold1,
      required this.headingLight1,
      required this.headingBold2,
      required this.headingLight2,
      required this.titleBold,
      required this.titleLight,
      required this.bodyBold1,
      required this.bodyLight1,
      required this.bodyBold2,
      required this.captionBold,
      required this.captionLight,
      required this.tinyBold});

  final TextStyle? headingBold;
  final TextStyle? headingLight;

  final TextStyle? headingBold1;
  final TextStyle? headingLight1;

  final TextStyle? headingBold2;
  final TextStyle? headingLight2;

  final TextStyle? titleBold;
  final TextStyle? titleLight;

  final TextStyle? bodyBold1;
  final TextStyle? bodyLight1;

  final TextStyle? bodyBold2;

  final TextStyle? captionBold;
  final TextStyle? captionLight;

  final TextStyle? tinyBold;

  @override
  TypographyExtension copyWith({TextStyle? bodyLight1}) {
    return TypographyExtension(
      headingBold: headingBold,
      headingLight: headingLight,
      headingBold1: headingBold1,
      headingLight1: headingLight1,
      headingBold2: headingBold2,
      headingLight2: headingLight2,
      titleBold: titleBold,
      titleLight: titleLight,
      bodyBold1: bodyBold1,
      bodyLight1: bodyLight1,
      bodyBold2: bodyBold2,
      captionBold: captionBold,
      captionLight: captionLight,
      tinyBold: tinyBold,
    );
  }

  @override
  ThemeExtension<TypographyExtension> lerp(
      covariant ThemeExtension<TypographyExtension>? other, double t) {
    if (other is! TypographyExtension) {
      return this;
    }
    return TypographyExtension(
      headingBold: TextStyle.lerp(headingBold, other.headingBold, t),
      headingBold1: TextStyle.lerp(headingBold1, other.headingBold1, t),
      headingLight: TextStyle.lerp(headingLight, other.headingLight, t),
      headingLight1: TextStyle.lerp(headingLight1, other.headingLight1, t),
      titleBold: TextStyle.lerp(titleBold, other.titleBold, t),
      titleLight: TextStyle.lerp(titleLight, other.titleLight, t),
      headingBold2: TextStyle.lerp(headingBold2, other.headingBold2, t),
      headingLight2: TextStyle.lerp(headingLight2, other.headingLight2, t),
      bodyBold1: TextStyle.lerp(bodyBold1, other.bodyBold1, t),
      bodyLight1: TextStyle.lerp(bodyLight1, other.bodyLight1, t),
      bodyBold2: TextStyle.lerp(bodyBold2, other.bodyBold2, t),
      captionBold: TextStyle.lerp(captionBold, other.bodyBold2, t),
      captionLight: TextStyle.lerp(captionLight, other.captionLight, t),
      tinyBold: TextStyle.lerp(tinyBold, other.tinyBold, t),
    );
  }
}

const typoGraphyExtension = TypographyExtension(
  headingBold: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  ),
  headingLight: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
  ),
  headingBold1: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  headingLight1: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headingBold2: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
  headingLight2: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
  titleBold: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  titleLight: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyBold1: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  ),
  bodyLight1: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  bodyBold2: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  ),
  captionBold: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  ),
  captionLight: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
  tinyBold: TextStyle(fontSize: 6, fontWeight: FontWeight.w400),
);
