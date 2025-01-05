import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

// ignore: must_be_immutable
class MephistoSwitch extends StatefulWidget {
  MephistoSwitch({
    super.key,
    required this.onClick,
    this.isSelected = false,
    this.isDefaultSelected = false,
    this.showBackgroundColor = false,
  });

  final bool? isDefaultSelected;
  final Function onClick;
  bool? isSelected;
  final bool showBackgroundColor;

  @override
  State<MephistoSwitch> createState() => _MephistoSwitchState();
}

class _MephistoSwitchState extends State<MephistoSwitch> {
  @override
  void initState() {
    super.initState();
    widget.isSelected = widget.isDefaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: SizedBox(
        height: 32,
        width: 56,
        child: Card(
          child: AnimatedContainer(
            height: 24,
            width: 24,
            margin: widget.isSelected!
                ? const EdgeInsets.only(top: 4, left: 26, right: 4, bottom: 4)
                : const EdgeInsets.only(left: 4, right: 26, top: 4, bottom: 4),
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
    );
  }
}
