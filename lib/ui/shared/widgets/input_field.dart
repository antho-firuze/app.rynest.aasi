import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../ui_helper.dart';
import 'icon_mask.dart';

enum InputStyle { style1, style2 }

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hintText,
    this.label,
    this.enterPressed,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.isPassword,
    this.isReadOnly,
    this.isDense = false,
    this.maxLines = 1,
    this.maxLength,
    this.icon,
    this.validator,
    this.action,
    this.value,
    this.radius,
    this.iconData,
  });

  final String? label;
  final String? hintText;
  final bool? isPassword;
  final bool? isReadOnly;
  final bool isDense;
  final int maxLines;
  final int? maxLength;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function()? enterPressed;
  final Function(dynamic)? onChanged;
  final TextInputFormatter? formatter;
  final String? Function(String?)? validator;
  final Widget? icon;
  final IconData? iconData;
  final Widget? action;
  final dynamic value;
  final double? radius;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController controller = TextEditingController(text: '');
  bool isPassword = false;
  bool showPassword = false;
  bool? isReadOnly;
  List<TextInputFormatter> inputFormatters = [];
  int currentLength = 0;
  int? maxLength;
  final focusNode = FocusNode();
  Widget? prefixIcon;

  @override
  void initState() {
    super.initState();

    isPassword = widget.isPassword ?? isPassword;
    isReadOnly = widget.isReadOnly ?? false;
    controller.text = widget.value ?? '';
    if (widget.formatter != null) inputFormatters.add(widget.formatter!);
    maxLength = widget.maxLength;
    prefixIcon = widget.icon;
    prefixIcon = prefixIcon ??
        (widget.iconData != null ? IconMask(widget.iconData) : null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: labelStyle(context),
          ),
        vSpace(5.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: widget.textInputType,
                focusNode: focusNode,
                textInputAction: widget.textInputAction,
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged!(value);
                  setState(
                      () => currentLength = controller.text.characters.length);
                },
                buildCounter: (context,
                    {int? currentLength, bool? isFocused, maxLength}) {
                  return Text(
                    '$currentLength/$maxLength',
                    style: bodyStyle(context),
                  );
                },
                maxLines: widget.maxLines,
                inputFormatters: inputFormatters,
                cursorColor: kcSecondaryColor,
                maxLength: widget.maxLength,
                onEditingComplete: () {
                  // debugPrint('onEditingComplete');
                  FocusScope.of(context).nextFocus();

                  if (widget.enterPressed != null) widget.enterPressed!();
                },
                // onFieldSubmitted: (value) {
                //   debugPrint('onFieldSubmitted');
                //   if (widget.nextFocusNode != null) {
                //     widget.nextFocusNode?.requestFocus();
                //   }
                // },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                obscureText: isPassword ? !showPassword : false,
                readOnly: isReadOnly!,
                style: bodyStyle(context)
                    .clr(isReadOnly! ? kcInputReadOnlyColor : kcInputColor),
                decoration: inputDecoration1(),
              ),
            ),
            if (widget.action != null) widget.action!,
          ],
        ),
      ],
    );
  }

  InputDecoration inputDecoration1() => InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: isReadOnly! ? Colors.black54 : Colors.grey),
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: isReadOnly! ? Colors.black54 : Colors.grey),
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(widget.radius ?? 25),
        ),
        prefixIcon: prefixIcon,
        hintText: widget.hintText,
        hintStyle: bodyStyle(context).clr(kcHintColor),
        alignLabelWithHint: true,
        counterText: widget.maxLength == null ? '' : null,
        isDense: true,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () => setState(() => showPassword = !showPassword),
                child: IconMask(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        filled: true,
      );
}
