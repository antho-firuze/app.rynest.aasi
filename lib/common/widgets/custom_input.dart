import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    super.key,
    this.controller,
    this.onSubmitted,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enterPressed,
    this.formatter,
    this.validator,
    this.onChanged,
  });

  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(dynamic val)? onChanged;
  final Function(String val)? onSubmitted;
  final bool enabled;
  final bool readOnly;
  final bool? isPassword;
  final int maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function()? enterPressed;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? val)? validator;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> with SingleTickerProviderStateMixin {
  bool isEmpty = true;
  bool showPassword = false;
  String? labelText;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    if (widget.readOnly || !widget.enabled) {
      labelText = widget.hintText;
    }

    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
    controller.addListener(checkValue);
    // Future.delayed(
    //   Duration.zero,
    //   () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    // );
  }

  void checkValue() {
    setState(() {
      isEmpty = controller.text.isEmpty;
      labelText = controller.text.isEmpty ? null : widget.hintText;
    });
  }

  Widget? generateCounter(BuildContext context,
          {required int currentLength, required bool isFocused, required int? maxLength}) =>
      widget.enabled && !widget.readOnly
          ? currentLength >= maxLength!
              ? Text('Max $maxLength chars').tsCaption().clr(Colors.red)
              : Text('$currentLength').tsCaption()
          : null;

  @override
  Widget build(BuildContext context) {
    var showClearBtn = InkWell(
      onTap: () => controller.text = '',
      child: const SizedBox(
        width: 45,
        child: Icon(Icons.clear),
      ),
    );

    var showPasswordVisibility = InkWell(
      onTap: () => setState(() {
        showPassword = !showPassword;
      }),
      child: SizedBox(
        width: 45,
        child: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
      ),
    );

    return TextFormField(
      controller: controller,
      autofocus: false,
      // focusNode: widget.focusNode,
      // style: tsBodyM(),
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: showPassword ? !showPassword : widget.isPassword!,
      buildCounter: generateCounter,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
        if (widget.enterPressed != null) widget.enterPressed!();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      inputFormatters: widget.formatter,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        labelText: labelText,
        // labelStyle: tsBodyM(),
        hintText: widget.hintText,
        // hintStyle: tsBodyM(),
        helperText: widget.helperText,
        counterText: widget.maxLength == null ? '' : null,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isEmpty && !widget.readOnly && widget.enabled) showClearBtn,
            if (widget.isPassword == true) showPasswordVisibility,
            widget.suffixIcon ?? Container()
          ],
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 47,
          minWidth: 37,
          minHeight: 47,
        ),
      ),
    );
  }
}
