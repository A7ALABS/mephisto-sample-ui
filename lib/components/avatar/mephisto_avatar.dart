import 'package:flutter/material.dart';

class MephistoAvatar extends StatefulWidget {
  const MephistoAvatar({
    super.key,
    this.image,
    this.height = 36,
    this.width = 36,
    this.isNetworkImage = false,
  });

  final double? height;
  final double? width;
  final String? image;
  final bool? isNetworkImage;
  @override
  State<MephistoAvatar> createState() => _MephistoAvatarState();
}

class _MephistoAvatarState extends State<MephistoAvatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: widget.isNetworkImage == true
              ? Image.network(
                  widget.image!,
                  height: widget.height,
                  width: widget.width,
                  fit: BoxFit.cover,
                )
              : Image.asset(widget.image!,
                  height: widget.height,
                  width: widget.width,
                  fit: BoxFit.cover),
        ));
  }
}
