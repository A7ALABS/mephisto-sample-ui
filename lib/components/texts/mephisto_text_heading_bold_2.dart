import 'package:flutter/material.dart';

class MephistoTextHeadingBold2 extends StatefulWidget {
  const MephistoTextHeadingBold2(
      {super.key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.textOverflow,
      this.disableTranslate = false,
      this.isUnderlined = false,
      this.textColor,
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
  State<MephistoTextHeadingBold2> createState() =>
      _MephistoTextHeadingBold2State();
}

class _MephistoTextHeadingBold2State extends State<MephistoTextHeadingBold2> {
  String translatedText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text.toString(),
        maxLines: widget.maxLines,
        overflow: widget.textOverflow,
        textAlign: widget.textAlign,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: true,
          leadingDistribution: TextLeadingDistribution.proportional,
        ),
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: widget.textColor,
            fontWeight: widget.fontWeight,
            decoration:
                widget.isUnderlined == true ? TextDecoration.underline : null));
  }
}
