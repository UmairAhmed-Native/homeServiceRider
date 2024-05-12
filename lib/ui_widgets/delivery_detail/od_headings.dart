import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OdHeadings extends StatelessWidget {
    String title;
    double titleSize;
    String? secondaryTitle;
    double underLineWidth;
    double underLinePadding;
    FontWeight fontWeight;
    Color textColor;
    double  flex;
    bool center;
    OdHeadings({required this.title,
      this.titleSize=12,
      this.secondaryTitle=null,
      required this.underLineWidth,
      required this.underLinePadding,
      required this.fontWeight,
      required this.textColor,
      required this.flex,required this.center});

  @override
  Widget build(BuildContext context) {
    return
        Expanded(
            flex: flex.toInt(), child: getHeading( title,titleSize,underLineWidth,underLinePadding,textColor,fontWeight,center)
    );
  }

  getHeading(String title, titleSize,double underLineWidth,double underLinePadding,Color textColor,fontWeight,bool center) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        center?Center(
          child: Text(
            overflow: TextOverflow.ellipsis,
            title,
            style: GoogleFonts.poppins(
                textStyle:  TextStyle(fontSize:titleSize,fontWeight:fontWeight,color: textColor)),
          ),
        ):
        Text(
          overflow: TextOverflow.ellipsis,
          title,
          style: GoogleFonts.poppins(
              textStyle:  TextStyle(fontSize:titleSize,fontWeight:fontWeight,color: textColor)),
        ),
        if(secondaryTitle!=null)
          center?Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              secondaryTitle??"",
              style: GoogleFonts.poppins(
                  textStyle:  TextStyle(fontSize:8,fontWeight:FontWeight.normal,color: Colors.grey)),
            ),
          ):Text(
            overflow: TextOverflow.ellipsis,
            secondaryTitle??"",
            style: GoogleFonts.poppins(
                textStyle:  TextStyle(fontSize:8,fontWeight:FontWeight.normal,color: Colors.grey)),
          ) else
          center?Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              " ",
              style: GoogleFonts.poppins(
                  textStyle:  TextStyle(fontSize:8,fontWeight:FontWeight.normal,color: Colors.grey)),
            ),
          ):Text(
            overflow: TextOverflow.ellipsis,
            " ",
            style: GoogleFonts.poppins(
                textStyle:  TextStyle(fontSize:8,fontWeight:FontWeight.normal,color: Colors.grey)),
          )
            ,
        Center(
          child: Container(
            color: Colors.blue,
            width: underLineWidth,
            height: 2,
          ),
        )
      ],
    );
  }


}
