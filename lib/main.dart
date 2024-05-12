import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_water_service_rider/screens/dashboard/Dashboard.dart';
import 'package:home_water_service_rider/screens/login/LoginScreen.dart';
import 'package:home_water_service_rider/screens/splash/SplashScreen.dart';
import 'package:home_water_service_rider/utils/shared_preference/SharePreferece.dart';

import 'model/User.dart';

User? user;
String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  user = await SharedPreferencesManager.getUser();
  token = await SharedPreferencesManager.geToken();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Home Water Service Rider',
        scrollBehavior: const ScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.titilliumWebTextTheme(),
          primarySwatch: Colors.blue,
          useMaterial3: false,
        ),
        home: user?.email != null ? Dashboard() : LoginScreen(),
      ),
    );
  }
}
