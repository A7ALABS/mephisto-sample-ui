import 'package:flutter/material.dart';

class MephistoTextBodyBold extends StatefulWidget {
  const MephistoTextBodyBold(
      {super.key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.textOverflow,
      this.disableTranslate = false,
      this.textColor,
      this.isUnderlined = false,
      this.fontWeight});
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool? disableTranslate;
  final bool? isUnderlined;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  State<MephistoTextBodyBold> createState() => _MephistoTextBodyBoldState();
}

class _MephistoTextBodyBoldState extends State<MephistoTextBodyBold> {
  String translatedText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      maxLines: widget.maxLines,
      overflow: widget.textOverflow,
      textAlign: widget.textAlign,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: true,
        leadingDistribution: TextLeadingDistribution.proportional,
      ),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          decoration:
              widget.isUnderlined == true ? TextDecoration.underline : null),
    );
  }
}
