import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_body_bold.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_body_bold_1.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_caption_bold.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class MephistoCenterIconButton extends ConsumerStatefulWidget {
  const MephistoCenterIconButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.variant = "lg",
      this.isBold = true,
      this.isDisabled = false,
      this.isLoading = false,
      this.bgColor,
      this.textColor = white,
      this.disabledBgColor,
      this.icon,
      this.suffixIcon});

  final String text;
  final bool? isDisabled;
  final bool? isLoading;
  final Function onClick;
  final String? variant;
  final Color? disabledBgColor;
  final bool? isBold;
  final Widget? icon;
  final Widget? suffixIcon;
  final Color? bgColor;
  final Color? textColor;

  @override
  ConsumerState<MephistoCenterIconButton> createState() =>
      _MephistoCenterIconButtonState();
}

class _MephistoCenterIconButtonState
    extends ConsumerState<MephistoCenterIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.variant == 'lg'
          ? 50
          : widget.variant == 'md'
              ? 35
              : widget.variant == 'sm'
                  ? 24
                  : widget.variant == 'xs'
                      ? 18
                      : 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(widget.bgColor),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon != null
                        ? Row(
                            children: [
                              widget.icon!,
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          )
                        : const SizedBox(),
                    widget.variant == 'lg'
                        ? MephistoTextBodyBold(
                            text: widget.text,
                            textColor: widget.textColor,
                            fontWeight: widget.isBold!
                                ? FontWeight.bold
                                : FontWeight.w500,
                          )
                        : widget.variant == 'md' || widget.variant == 'sm'
                            ? MephistoTextBodyBold1(
                                fontWeight: widget.isBold!
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                textColor: widget.textColor,
                                text: widget.text)
                            : widget.variant == 'xs'
                                ? MephistoTextCaptionBold(
                                    fontWeight: widget.isBold!
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    textColor: widget.textColor,
                                    text: widget.text)
                                : MephistoTextCaptionBold(
                                    fontWeight: widget.isBold!
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    textColor: widget.textColor,
                                    text: widget.text),
                    widget.suffixIcon != null
                        ? Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              widget.suffixIcon!,
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
      ),
    );
  }
}
