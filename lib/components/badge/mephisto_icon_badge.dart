import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MephistoIconBadge extends ConsumerStatefulWidget {
  const MephistoIconBadge(
      {super.key,
      this.icon,
      this.shrink = true,
      this.onTap,
      this.variant = 'md',
      this.showOutline = false});

  final bool? shrink;
  final Widget? icon;
  final Function? onTap;
  final String? variant;
  final bool? showOutline;

  @override
  ConsumerState<MephistoIconBadge> createState() => MephistoIconBadgeState();
}

class MephistoIconBadgeState extends ConsumerState<MephistoIconBadge> {
  double getWidgetSize() {
    switch (widget.variant) {
      case 'lg':
        return 112;
      case 'md':
        return 56;
      case 'sm':
        return 38;
      case 'xs':
        return 24;
      default:
        return 38;
    }
  }

  double getWidgetOutlineSize() {
    switch (widget.variant) {
      case 'lg':
        return 176;
      case 'md':
        return 88;
      case 'sm':
        return 58;
      case 'xs':
        return 44;
      default:
        return 58;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        child: SizedBox(
          height: widget.showOutline == true
              ? getWidgetOutlineSize()
              : getWidgetSize(),
          width: widget.showOutline == true
              ? getWidgetOutlineSize()
              : getWidgetSize(),
          child: Chip(
            elevation: 0,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            visualDensity:
                VisualDensity(vertical: widget.variant == 'xs' ? -4 : 0),
            side: BorderSide.none,
            shape: widget.showOutline == true &&
                    (Theme.of(context).chipTheme.shape!
                                as SmoothRectangleBorder)
                            .borderRadius
                            .bottomLeft
                            .cornerRadius >=
                        16
                ? (Theme.of(context).chipTheme.shape! as SmoothRectangleBorder)
                    .copyWith(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 16, cornerSmoothing: 1),
                  )
                : null,
            surfaceTintColor: Colors.transparent,
            backgroundColor: widget.showOutline == true
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : null,
            label: Center(
              child: SizedBox(
                height: getWidgetSize(),
                width: getWidgetSize(),
                child: Chip(
                  side: BorderSide.none,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  visualDensity:
                      VisualDensity(vertical: widget.variant == 'xs' ? -4 : 0),
                  shape: widget.showOutline == true &&
                          (Theme.of(context).chipTheme.shape!
                                      as SmoothRectangleBorder)
                                  .borderRadius
                                  .bottomLeft
                                  .cornerRadius >=
                              16
                      ? (Theme.of(context).chipTheme.shape!
                              as SmoothRectangleBorder)
                          .copyWith(
                          borderRadius: SmoothBorderRadius(
                              cornerRadius: widget.variant == 'xs' ? 12 : 16,
                              cornerSmoothing: 1),
                        )
                      : null,
                  label: SizedBox(
                    height: getWidgetSize(),
                    width: getWidgetSize(),
                    child: Center(child: widget.icon!),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
