import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OdHeader extends StatelessWidget {
  const OdHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 150,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.only(top:20,left: 15.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back)
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "images/logo.png",
                      ),
                    ),
                  ),
                  Text(
                    "Order Details",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
