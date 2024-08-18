import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app.rynest.aasi/ui/shared/shared_styles.dart';

class ReadOnlyFieldLabel extends StatefulWidget {
  const ReadOnlyFieldLabel(
    this.label, {
    super.key,
    this.placeholder,
    this.enterPressed,
    this.formatter,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.smallVersion = false,
    this.maxLines = 1,
    this.icon,
    this.action,
    this.value,
  });

  final String label;
  final String? placeholder;
  final dynamic value;
  final Function? enterPressed;
  final TextInputType textInputType;
  final bool password;
  final bool smallVersion;
  final int maxLines;
  final TextInputFormatter? formatter;
  final Widget? icon;
  final Widget? action;

  @override
  State<ReadOnlyFieldLabel> createState() => _InputFieldLabelState();
}

class _InputFieldLabelState extends State<ReadOnlyFieldLabel> {
  bool isPassword = false;
  double fieldHeight = 75;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: fieldPadding,
          // decoration:
          //     widget.isReadOnly ? disabledFieldDecortaion : fieldDecortaion,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(text: widget.value),
                  keyboardType: widget.textInputType,
                  focusNode: focusNode,
                  textInputAction: TextInputAction.next,
                  maxLines: widget.maxLines,
                  inputFormatters:
                      widget.formatter != null ? [widget.formatter!] : null,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();

                    if (widget.enterPressed != null) widget.enterPressed!();
                  },
                  style: const TextStyle(color: Colors.grey),
                  obscureText: isPassword,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: false,
                    labelText: widget.label,
                    labelStyle: TextStyle(
                      fontSize: widget.smallVersion ? 15 : 16,
                      height: 0,
                    ),
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    // border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    icon: widget.icon ?? const Icon(Icons.edit),
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(
                      fontSize: widget.smallVersion ? 15 : 16,
                    ),
                  ),
                ),
              ),
              widget.password
                  ? GestureDetector(
                      onTap: () => setState(() {
                        isPassword = !isPassword;
                      }),
                      child: widget.password
                          ? Container(
                              width: fieldHeight,
                              height: fieldHeight,
                              alignment: Alignment.center,
                              child: Icon(
                                isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            )
                          : Container(),
                    )
                  : widget.action == null
                      ? Container()
                      : widget.action!,
            ],
          ),
        ),
        // if (widget.additionalNote != null) vSpace(5),
        // if (widget.additionalNote != null) NoteText(widget.additionalNote),
        vSpaceSmall
      ],
    );
  }
}
