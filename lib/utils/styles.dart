import 'package:flutter/material.dart';

//=======================================================================================
//              TODO : TextStyle
//=======================================================================================

var bold = FontWeight.bold;
var textFieldStyle = TextStyle(color: lightgrey, fontSize: 12);
var rememberStyle = TextStyle(color: lightgrey);

var textHeading =
    TextStyle(color: Colors.black, fontSize: 15, fontWeight: bold);

//=======================================================================================
//              TODO : password field Decoration Login
//=======================================================================================

InputDecoration decorationPasswordHintStyle(
    String hint, String icon_path, Widget icon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 11),
    hintText: hint,
    hintStyle: textFieldStyle,
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: icon,
    fillColor: white,
    filled: true,
    enabledBorder:const OutlineInputBorder(
      borderSide:BorderSide(width: 1, color: Color(0xffffffff)),
    ),
    focusedBorder:const OutlineInputBorder(
      borderSide:BorderSide(width: 1, color: Colors.white),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide:const BorderSide(color: white, width: 0),
    ),
  );
}
//=======================================================================================
//              TODO : emaiL field Decoration Login
//=======================================================================================

InputDecoration decorationHintStyle(
    String hint, String icon_path, IconData icon,{Color? color}) {
  return InputDecoration(
    counterText: "",
    contentPadding: const EdgeInsets.only(top: 14),
    hintText: hint,
    hintStyle: textFieldStyle,
    errorStyle: const TextStyle(color: Colors.red),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    ),
    fillColor: white,
    filled: true,

    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xFFFFFFFF)),
    ),  disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xffffffff)),
    ),
    focusedBorder:const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    ),
    prefixIcon: icon_path.isNotEmpty
        ? Image.asset(
            icon_path,
            width: 8,
            height: 8,
          )
        : Icon(icon,color: color,),
  );
}

//=======================================================================================
//              TODO : Colors
//=======================================================================================

const lightgrey = Color(0xff868889);

const fogotTextColor = Color(0xff407EC7);
const screenbg = Color(0xffF4F5F9);
const white = Colors.white;
const green = Color(0xff6CC51D);

//=======================================================================================
//              TODO : Image Constants
//=======================================================================================

var mainLogo = "images/logo.png";
