import 'package:mephisto_ui/components/avatar/mephisto_avatar.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_caption_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MephistoAppBar extends StatefulWidget {
  const MephistoAppBar(
      {super.key,
      required this.title,
      this.showBackArrow = false,
      this.isDefaultBackAction = true,
      this.onBackArrowTap,
      this.onSuffixIconTap,
      this.isSuffixProcessing = false,
      this.suffixIcon,
      this.onPrefixIconTap,
      this.prefixIcon,
      this.image,
      this.placeholder});

  final Widget title;
  final bool? showBackArrow;
  final bool? isDefaultBackAction;
  final bool? isSuffixProcessing;
  final Function? onBackArrowTap;
  final Widget? suffixIcon;
  final Function? onSuffixIconTap;
  final Widget? prefixIcon;
  final Function? onPrefixIconTap;
  final String? image;
  final String? placeholder;
  @override
  State<MephistoAppBar> createState() => _MephistoAppBarState();
}

class _MephistoAppBarState extends State<MephistoAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // prefix
          Row(
            children: [
              SizedBox(
                height:
                    widget.showBackArrow == true || widget.prefixIcon != null
                        ? 24
                        : 0,
                width: widget.showBackArrow == true || widget.prefixIcon != null
                    ? 24
                    : 0,
                child: widget.showBackArrow!
                    ? InkWell(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        onTap: () {
                          if (widget.isDefaultBackAction!) {
                            Get.back();
                          } else {
                            if (widget.onBackArrowTap != null) {
                              widget.onBackArrowTap!();
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: Icon(
                            CupertinoIcons.arrow_left,
                            size: 20,
                          ),
                        ),
                      )
                    : widget.prefixIcon != null
                        ? InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            onTap: () {
                              if (widget.onPrefixIconTap != null) {
                                widget.onPrefixIconTap!();
                              }
                            },
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: widget.prefixIcon,
                            ),
                          )
                        : const SizedBox(),
              ),
            ],
          ),
          SizedBox(
            width: !widget.showBackArrow! && widget.prefixIcon != null
                ? 12
                : widget.showBackArrow!
                    ? 8
                    : 0,
          ),
          // title and other data
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.image != null
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 2,
                          ),
                          MephistoAvatar(
                            image: widget.image!,
                            isNetworkImage: false,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      )
                    : const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.placeholder != null
                        ? MephistoTextCaptionLight(
                            text: widget.placeholder!,
                            textColor:
                                Theme.of(context).textTheme.bodyLarge!.color,
                          )
                        : const SizedBox(),
                    widget.title
                  ],
                ),
              ],
            ),
          ),
          // suffix
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.suffixIcon != null
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: widget.isSuffixProcessing!
                          ? const CircularProgressIndicator()
                          : InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              onTap: () {
                                if (widget.onSuffixIconTap != null) {
                                  widget.onSuffixIconTap!();
                                }
                              },
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: widget.suffixIcon,
                              ),
                            ),
                    )
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
