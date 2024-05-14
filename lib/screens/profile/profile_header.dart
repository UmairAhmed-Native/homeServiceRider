import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade400,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
                radius: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(userModel?.firstName??"",style: textHeading,),
            Text(
              "Hassan",
              style: textHeading,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
// CircularProfileAvatar(
//
// userModel?.profileImage??"",
// borderColor: Colors.white,
// borderWidth: 1,
// elevation: 2,
// radius: 50,
// )