import 'package:flutter/material.dart';

class MephistoTextBodyLight1 extends StatefulWidget {
  const MephistoTextBodyLight1(
      {super.key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.textOverflow,
      this.disableTranslate = false,
      this.textColor,
      this.fontWeight,
      this.size,
      this.isUnderlined = false});
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool? disableTranslate;
  final bool? isUnderlined;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? size;

  @override
  State<MephistoTextBodyLight1> createState() => _MephistoTextBodyLight1State();
}

class _MephistoTextBodyLight1State extends State<MephistoTextBodyLight1> {
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
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: widget.textColor,
          fontSize: widget.size,
          decoration:
              widget.isUnderlined == true ? TextDecoration.underline : null),
    );
  }
}
