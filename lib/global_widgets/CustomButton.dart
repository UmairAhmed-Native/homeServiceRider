import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPress;

  const CustomButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 39,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                side: BorderSide.none),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
