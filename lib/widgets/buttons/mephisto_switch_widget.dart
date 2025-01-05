import 'package:mephisto_ui/components/texts/mephisto_text_body_bold.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MephistoSwitchWidget extends StatefulWidget {
  MephistoSwitchWidget(
      {super.key,
      required this.text,
      required this.onClick,
      this.isDisabled = false,
      this.isSelected = false,
      this.isDefaultSelected = false,
      this.showBackgroundColor = false,
      this.prefixIcon,
      this.defaultPadding = 10.0});

  final String text;
  final double defaultPadding;
  final bool? isDisabled;
  final bool? isDefaultSelected;
  final Function onClick;
  bool? isSelected;
  final bool showBackgroundColor;
  final Widget? prefixIcon;

  @override
  State<MephistoSwitchWidget> createState() => _MephistoSwitchWidgetState();
}

class _MephistoSwitchWidgetState extends State<MephistoSwitchWidget> {
  @override
  void initState() {
    super.initState();
    widget.isSelected = widget.isDefaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {widget.onClick()},
      child: Card(
        color: widget.showBackgroundColor
            ? Theme.of(context).extension<ColorExtension>()!.neutralBgColor2
            : Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(widget.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    widget.prefixIcon ?? const SizedBox(),
                    SizedBox(width: widget.prefixIcon != null ? 8 : 0),
                    Expanded(
                      child: MephistoTextBodyBold(
                        text: widget.text,
                      ),
                    ),
                  ],
                ),
              ),
              widget.text.isNotEmpty
                  ? const SizedBox(
                      width: 10,
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: () => widget.onClick(),
                child: SizedBox(
                  height: 32,
                  width: 56,
                  child: Card(
                    child: AnimatedContainer(
                      height: 24,
                      width: 24,
                      margin: widget.isSelected!
                          ? const EdgeInsets.only(
                              top: 4, left: 26, right: 4, bottom: 4)
                          : const EdgeInsets.only(
                              left: 4, right: 26, top: 4, bottom: 4),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      child: Card(
                        color: widget.isSelected!
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.2),
                        margin: const EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
