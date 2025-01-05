import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class MephistoPopup extends StatefulWidget {
  const MephistoPopup(
      {super.key,
      required this.modal,
      this.onClose,
      this.borderRadius,
      this.showElevation = true,
      this.hideBgColor = false,
      this.defaultPadding = true,
      this.margin = 15});

  final Widget modal;
  final Function? onClose;
  final bool? showElevation;
  final bool? hideBgColor;
  final bool? defaultPadding;
  final double? borderRadius;
  final double? margin;

  @override
  State<MephistoPopup> createState() => _MephistoPopupState();
}

class _MephistoPopupState extends State<MephistoPopup>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  late SmoothRectangleBorder? shape;
  late double? borderRadius;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 200.0, end: 0.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    shape = Theme.of(context).cardTheme.shape as SmoothRectangleBorder;
    return SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      child: Material(
        elevation: widget.showElevation! ? 10 : 0,
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            _controller = AnimationController(
                duration: const Duration(milliseconds: 200), vsync: this)
              ..addListener(() {
                setState(() {});
              });
            animation = Tween(
                    begin: 0.0,
                    end: MediaQuery.of(context).size.height.toDouble())
                .animate(_controller);
            _controller.forward();
            Future.delayed(const Duration(milliseconds: 200), () {
              widget.onClose!();
            });
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 15.0,
            ),
            child: Container(
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, animation.value),
                    // child: widget.modal,
                    child: Dialog(
                      elevation: widget.showElevation! ? 10 : 0,
                      insetPadding: EdgeInsets.all(widget.margin!),
                      backgroundColor: Colors.transparent,
                      shape: widget.borderRadius != null
                          ? shape!.copyWith(
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: widget.borderRadius!,
                                cornerSmoothing: 1,
                              ),
                            )
                          : shape!.copyWith(
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Card(
                          shape: widget.borderRadius != null
                              ? shape!.copyWith(
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: widget.borderRadius!,
                                    cornerSmoothing: 1,
                                  ),
                                )
                              : shape!.copyWith(
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: shape!
                                        .borderRadius.bottomLeft.cornerRadius,
                                    cornerSmoothing: 1,
                                  ),
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                          color: widget.hideBgColor!
                              ? Colors.transparent
                              : Theme.of(context).scaffoldBackgroundColor,
                          child: Container(
                              padding: EdgeInsets.all(
                                  widget.defaultPadding! ? 20 : 0),
                              color: Colors.transparent,
                              child: widget.modal),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
