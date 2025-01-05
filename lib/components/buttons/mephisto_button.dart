import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_body_bold.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_body_bold_1.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_caption_bold.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
// ignore: depend_on_referenced_packages

class MephistoButton extends ConsumerStatefulWidget {
  const MephistoButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.variant = "lg",
      this.isBold = true,
      this.isDisabled = false,
      this.isLoading = false,
      this.textColor,
      this.opacity = 1,
      this.disabledBgColor,
      this.isFullWidth = false,
      this.bgColor,
      this.content});

  final String text;
  final Function onClick;
  final Color? bgColor;
  final bool? isLoading;
  final String? variant;
  final bool? isDisabled;
  final Color? disabledBgColor;
  final bool? isBold;
  final Color? textColor;
  final double opacity;
  final bool? isFullWidth;
  final Widget? content;

  @override
  ConsumerState<MephistoButton> createState() => _MephistoButtonState();
}

class _MephistoButtonState extends ConsumerState<MephistoButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: widget.variant == 'lg'
              ? 50
              : widget.variant == 'md'
                  ? 35
                  : widget.variant == 'sm'
                      ? 24
                      : widget.variant == 'xs'
                          ? 18
                          : 50,
          minWidth: widget.isFullWidth == true ? double.infinity : 0),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets?>(
            const EdgeInsets.symmetric(horizontal: 12),
          ),
          minimumSize: WidgetStateProperty.all<Size?>(const Size(53, 50)),
          backgroundColor: WidgetStateProperty.all<Color?>(
              (widget.bgColor ?? Theme.of(context).primaryColor)
                  .withOpacity(widget.opacity)),
        ),
        onPressed: widget.isDisabled! ? null : () => widget.onClick(),
        child: widget.isLoading!
            ? const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(
                    color: white,
                  ),
                ),
              )
            : SizedBox(
                child: Center(
                  child: widget.content ??
                      (widget.variant == 'lg'
                          ? MephistoTextBodyBold(
                              text: widget.text,
                              textColor: widget.textColor ?? white,
                              fontWeight: widget.isBold!
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            )
                          : widget.variant == 'md' || widget.variant == 'sm'
                              ? MephistoTextBodyBold1(
                                  fontWeight: widget.isBold!
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  textColor: widget.textColor ?? white,
                                  text: widget.text)
                              : widget.variant == 'xs'
                                  ? MephistoTextCaptionBold(
                                      fontWeight: widget.isBold!
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      textColor: widget.textColor ?? white,
                                      text: widget.text)
                                  : MephistoTextCaptionBold(
                                      fontWeight: widget.isBold!
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      textColor: widget.textColor ?? white,
                                      text: widget.text)),
                ),
              ),
      ),
    );
  }
}
