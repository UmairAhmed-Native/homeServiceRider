
import 'package:flutter/material.dart';
import 'package:home_water_service_rider/screens/profile/profile_info_text.dart';

import '../../main.dart';


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10,),
          ProfileInfoText(title: "First Name:",value: "Hassan"),

          ProfileInfoText(title: "Last Name:",value: "Yousuf"),
          ProfileInfoText(title: "Email:",value:user?.email ?? "hassan@gmail.com"),
          // ProfileInfoText(title: "phone:",value: "19-06-1998"),
          ProfileInfoText(title: "address:",value:user?.address??"karachi"),
        ],
      ),
    );
  }
}