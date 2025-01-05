import 'package:flutter/material.dart';

class MephistoTextCaptionLight extends StatefulWidget {
  const MephistoTextCaptionLight(
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
  State<MephistoTextCaptionLight> createState() =>
      _MephistoTextCaptionLightState();
}

class _MephistoTextCaptionLightState extends State<MephistoTextCaptionLight> {
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
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          decoration:
              widget.isUnderlined == true ? TextDecoration.underline : null),
    );
  }
}
