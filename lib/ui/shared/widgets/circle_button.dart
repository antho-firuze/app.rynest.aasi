import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class CircleButton extends StatefulWidget {
  final bool busy;
  final String? title;
  final Function()? onPressed;
  final bool enabled;
  final Widget? child;
  final double? size;
  const CircleButton({
    super.key,
    this.title,
    this.busy = false,
    required this.onPressed,
    this.enabled = true,
    this.child,
    this.size,
  });

  @override
  CircleButtonState createState() => CircleButtonState();
}

class CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.size ?? 45,
      width: widget.size ?? 45,
      // height: widget.busy ? 40 : null,
      // width: widget.busy ? 40 : null,
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: widget.busy ? 2 : 2, vertical: widget.busy ? 2 : 2),
      decoration: BoxDecoration(
        color: widget.enabled ? kcSecondaryColor : Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
            // color: Colors.black87,
            // blurRadius: 5,
            // offset: Offset.fromDirection(45, 3),
          )
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            child: !widget.busy
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: widget.child,
                  )
                : const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          ),
        ),
      ),
    );
  }
}
