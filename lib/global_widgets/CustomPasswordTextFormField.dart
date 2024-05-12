import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  String? Function(String value) validator;
  final TextEditingController controller;
  final void Function(String value) onChange;
  final String hintText;

  CustomPasswordTextFormField({
    required this.validator,
    required this.controller,
    required this.onChange,
    required this.hintText,
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: TextFormField(
        validator: (value) {
          return widget.validator(value.toString());
        },
        onChanged: widget.onChange,
        cursorColor: Colors.black,
        obscureText: _isHide,
        textAlign: TextAlign.left,
        controller: widget.controller,
        style: textFieldStyle,
        keyboardType: TextInputType.text,
        decoration: decorationPasswordHintStyle(
          widget.hintText,
          "images/ic_lock.png",
          InkWell(
            onTap: () {
              showPassword();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                _isHide ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPassword() {
    setState((){
      _isHide = !_isHide;
    });

  }
}
