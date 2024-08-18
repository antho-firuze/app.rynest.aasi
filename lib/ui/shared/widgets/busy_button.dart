import 'package:flutter/material.dart';

import '../app_colors.dart';

enum IconPosition { left, top, right, bottom }

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  const BusyButton({
    super.key,
    this.title,
    this.busy = false,
    this.enabled = true,
    this.icon,
    this.color,
    required this.onPressed,
    this.iconPosition = IconPosition.left,
  });

  final bool busy;
  final String? title;
  final Function()? onPressed;
  final bool enabled;
  final Icon? icon;
  final IconPosition iconPosition;
  final Color? color;

  @override
  BusyButtonState createState() => BusyButtonState();
}

class BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    Color activeColor = widget.color ?? primaryColor;
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Material(
        color: activeColor,
        child: InkWell(
          onTap: widget.enabled ? widget.onPressed : null,
          child: AnimatedContainer(
            height: widget.busy ? 45 : 45,
            width: widget.busy ? 45 : 45,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            // padding: EdgeInsets.symmetric(
            //   horizontal: widget.busy ? 10 : 15,
            //   vertical: widget.busy ? 10 : 10,
            // ),
            color: widget.enabled ? Colors.transparent : Colors.grey[300],
            // decoration: BoxDecoration(
            //   color: widget.enabled ? activeColor : Colors.grey[300],
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: !widget.busy
                ? body
                : const SizedBox(
                    width: 25,
                    child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)),
                  ),
          ),
          // child: AnimatedContainer(
          //   height: widget.busy ? 40 : null,
          //   width: widget.busy ? 40 : null,
          //   duration: const Duration(milliseconds: 300),
          //   alignment: Alignment.center,
          //   padding: EdgeInsets.symmetric(
          //     horizontal: widget.busy ? 10 : 15,
          //     vertical: widget.busy ? 10 : 10,
          //   ),
          //   decoration: BoxDecoration(
          //     color: widget.enabled ? activeColor : Colors.grey[300],
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: !widget.busy
          //       ? body
          //       : SizedBox(
          //           width: 25,
          //           child: CircularProgressIndicator(
          //               strokeWidth: 2,
          //               valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          //         ),
          // ),
        ),
      ),
    );
  }

  get body {
    return widget.icon;
    // return widget.icon != null
    //     ? Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           // Icon(widget.icon),
    //           widget.icon!,
    //           if (widget.title != null)
    //             Text(
    //               widget.title!,
    //               style: captionStyle(context).copyWith(color: Colors.white),
    //             )
    //         ],
    //       )
    //     : Text(
    //         widget.title!,
    //         style: captionStyle(context).copyWith(color: Colors.white),
    //       );
  }
}
