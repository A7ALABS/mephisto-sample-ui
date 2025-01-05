import 'package:flutter/material.dart';

class MephistoTextBodyLight extends StatefulWidget {
  const MephistoTextBodyLight(
      {super.key,
      required this.text,
      this.textAlign,
      this.maxLines,
      this.textOverflow,
      this.disableTranslate = false,
      this.isUnderlined = false,
      this.size,
      this.textColor,
      this.fontWeight});
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool? disableTranslate;
  final bool? isUnderlined;
  final Color? textColor;
  final double? size;
  final FontWeight? fontWeight;
  @override
  State<MephistoTextBodyLight> createState() => _MephistoTextBodyLightState();
}

class _MephistoTextBodyLightState extends State<MephistoTextBodyLight> {
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
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: widget.size,
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          decoration:
              widget.isUnderlined == true ? TextDecoration.underline : null),
    );
  }
}
