import 'package:flutter/material.dart';

class OdButtons extends StatelessWidget {
  Function() openMapDirection;
  Function() markAsComplete;


  OdButtons({required this.openMapDirection, required this.markAsComplete});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              markAsComplete();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                side: BorderSide.none),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                Text("Mark as Complete")
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ElevatedButton(
            onPressed: () {
              openMapDirection();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                side: BorderSide.none),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pin_drop,
                  color: Colors.blue,
                ),
                Text("Track Location")
              ],
            ),
          ),
        )
      ],
    );
  }
}
