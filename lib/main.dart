import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_water_service_rider/screens/OrderDetail/OrderDetail.dart';
import 'package:home_water_service_rider/screens/dashboard/Dashboard.dart';
import 'package:home_water_service_rider/screens/login/LoginScreen.dart';
import 'package:home_water_service_rider/screens/splash/SplashScreen.dart';
import 'package:home_water_service_rider/utils/shared_preference/SharePreferece.dart';

import 'model/User.dart';

User? user;
String? token;
String orderStatus = "";
String orderId = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  user = await SharedPreferencesManager.getUser();
  orderStatus = await SharedPreferencesManager.getOrderStatus();
  orderId = await SharedPreferencesManager.getOrderId();
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
          home: _navigateHandler()),
    );
  }

  Widget _navigateHandler() {
    if (user != null) {
      if (user?.email != null) {
        if (orderStatus == "Start") {
          return OrderDetail(orderId: orderId);
        } else {
          return Dashboard();
        }
      } else {
        return Dashboard();
      }
    } else {
      return LoginScreen();
    }
  }
}
