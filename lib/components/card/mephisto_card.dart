import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class MephistoCard extends StatefulWidget {
  const MephistoCard(
      {super.key,
      required this.child,
      this.borderRadius,
      this.showTapFeedback = false,
      this.hideBorder = false,
      this.edgeInsets = const EdgeInsets.all(0),
      this.onTap,
      this.color});

  final Widget child;
  final Color? color;
  final Function? onTap;
  final bool? showTapFeedback;
  final double? borderRadius;
  final EdgeInsets? edgeInsets;
  final bool? hideBorder;

  @override
  State<MephistoCard> createState() => _MephistoCardState();
}

class _MephistoCardState extends State<MephistoCard> {
  late SmoothRectangleBorder? shape;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    shape = Theme.of(context).cardTheme.shape as SmoothRectangleBorder;
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius:
            widget.borderRadius ?? shape!.borderRadius.topLeft.cornerRadius,
        cornerSmoothing: widget.borderRadius != null
            ? 1
            : shape!.borderRadius.topLeft.cornerSmoothing,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
            widget.borderRadius ?? shape!.borderRadius.topLeft.cornerRadius),
        onTap: widget.onTap != null
            ? () {
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              }
            : null,
        child: Card(
          elevation: 0,
          color: widget.color,
          shape: widget.borderRadius != null
              ? shape!.copyWith(
                  side: const BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: widget.borderRadius!,
                    cornerSmoothing: 1,
                  ),
                )
              : shape!.copyWith(
                  side: widget.hideBorder == true
                      ? const BorderSide(width: 0, color: Colors.transparent)
                      : shape!.side,
                ),
          child: Padding(
            padding: widget.edgeInsets!,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
