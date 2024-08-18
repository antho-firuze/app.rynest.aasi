import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({super.key, 
    required this.label,
    this.textOnLeft = true,
    required this.onChanged,
    this.enabled = true,
    required this.value,
  });

  final String label;
  final bool textOnLeft;
  final void Function(bool?)? onChanged;
  final bool enabled;
  final bool value;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged!(!widget.value);
      },
      child: Row(
        children: <Widget>[
          if (widget.textOnLeft) Text(widget.label),
          Checkbox(
            value: widget.value,
            onChanged: widget.onChanged,
          ),
          if (!widget.textOnLeft) Text(widget.label),
        ],
      ),
    );
  }
}
