import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget HorizontalDynamicTextWiget(
        String heading, List<String> title, String separatorChar,
        [bool boldHeading = false,
        bool boldTitle = false,
        bool boldSeparator = false]) =>
    Row(
      children: [
        Text("$heading",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 10,
                    color: Color(0xC7626262),
                    fontWeight:
                        boldHeading ? FontWeight.bold : FontWeight.normal))),
        Text(" $separatorChar ",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 10,
                    color: Color(0xC7626262),
                    fontWeight:
                        boldSeparator ? FontWeight.bold : FontWeight.normal))),
        Column(
          children: [
            for (var i = title.length; i > 0; i--)
              Text(
                title.join(""),
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 10,
                        color: Color(0xC7626262),
                        fontWeight:
                            boldTitle ? FontWeight.bold : FontWeight.normal)),
              ),
          ],
        ),
      ],
    );
