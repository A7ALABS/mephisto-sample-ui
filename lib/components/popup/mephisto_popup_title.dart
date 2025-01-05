import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_bold.dart';

class MephistoPopupTitle extends StatefulWidget {
  const MephistoPopupTitle(
      {super.key,
      required this.title,
      this.onClose,
      this.prefixWidget,
      this.edgeInsets = const EdgeInsets.all(0),
      this.height,
      this.fillColor});

  final String title;
  final Function? onClose;
  final Widget? prefixWidget;
  final double? height;
  final Color? fillColor;
  final EdgeInsets? edgeInsets;

  @override
  State<MephistoPopupTitle> createState() => _MephistoPopupTitleState();
}

class _MephistoPopupTitleState extends State<MephistoPopupTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 56,
      color: widget.fillColor ?? Colors.transparent,
      child: Padding(
        padding: widget.edgeInsets!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24,
                  width: 60,
                  child: widget.prefixWidget,
                ),
                Expanded(
                  child: MephistoTextTitleBold(
                    text: widget.title,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            if (widget.onClose != null) {
                              widget.onClose!();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          child: SvgPicture.asset('assets/svgs/cross.svg')),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            const Divider(
              thickness: 1,
              height: 1,
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
