import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/buttons/mephisto_button.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_heading_bold_2.dart';

class MephistoHeader extends StatefulWidget {
  const MephistoHeader(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.onClick});
  final String title;
  final Function onClick;
  final String buttonText;
  @override
  State<MephistoHeader> createState() => _MephistoHeaderState();
}

class _MephistoHeaderState extends State<MephistoHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MephistoTextHeadingBold2(text: widget.title),
        ),
        MephistoButton(
          text: widget.buttonText,
          onClick: () {
            widget.onClick();
          },
          variant: 'md',
        ),
      ],
    );
  }
}
