import 'package:flutter/material.dart';

class MephistoTextTitleBold extends StatefulWidget {
  const MephistoTextTitleBold(
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
  State<MephistoTextTitleBold> createState() => _MephistoTextTitleBoldState();
}

class _MephistoTextTitleBoldState extends State<MephistoTextTitleBold> {
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
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          decoration:
              widget.isUnderlined == true ? TextDecoration.underline : null),
    );
  }
}
