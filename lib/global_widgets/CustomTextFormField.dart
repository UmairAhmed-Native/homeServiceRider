import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  String? Function(String value) validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final String iconPath;
  final IconData icon;
  final String hintText;
  bool? enabled=false;
  Color? color;
  int? length = 50;
  final void Function(String value) onChange;
  CustomTextFormField({
    Key? key,
    this.length,
    required this.validator,
    required this.controller,
    required this.inputType,
    required this.iconPath,
    required this.icon,
    required this.hintText,
    required this.onChange,
    this.enabled,
    this.color,

  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: TextFormField(
        validator: (value) {
          return widget.validator(value.toString());
        },
        autofocus: true,
        cursorColor: Colors.black,
        enabled: widget.enabled ?? true,
        onChanged: widget.onChange,
        textAlign: TextAlign.left,
        maxLength: widget.length ?? 50,
        controller: widget.controller,
        style: textFieldStyle,
        keyboardType: widget.inputType,
        decoration: decorationHintStyle(
            widget.hintText,
            widget.iconPath,
            widget.icon,
            color:widget.color

        ),
      ),
    );
  }
}