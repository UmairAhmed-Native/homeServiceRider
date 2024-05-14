import 'package:flutter/material.dart';

class ProfileInfoText extends StatelessWidget {
  String? title;
  String? value;

  ProfileInfoText({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
            width: 90,
            child: Text(title ?? "", style: TextStyle(fontSize: 12))),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          value ?? "",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ))
      ],
    );
  }
}
