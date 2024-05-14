import 'package:flutter/material.dart';
import 'package:home_water_service_rider/screens/profile/profile_header.dart';
import 'package:home_water_service_rider/screens/profile/profile_info.dart';
import 'package:home_water_service_rider/utils/Widget_extensions.dart';

import '../../global_widgets/CustomButton.dart';
import '../../utils/decorations.dart';
import '../../utils/shared_preference/SharePreferece.dart';
import '../login/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              top: 100,
              child: Image.asset(
                opacity: const AlwaysStoppedAnimation(0.2),
                'images/dummy.png',
                // Replace 'assets/background_image.jpg' with your image path
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeader(),
                  const ProfileInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  CustomButton(
                    onPress: () {
                      SharedPreferencesManager.logout();

                      LoginScreen().launch(context,
                          isNewTask: true,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    title: 'Log Out',
                  )
                ],
              ),
            )
          ],
        );
      }),
    ));
  }
}
