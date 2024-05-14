import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_water_service_rider/model/Orders.dart';
import 'package:home_water_service_rider/model/SingleOrderResponse.dart';
import 'package:home_water_service_rider/utils/Commons.dart';
import 'package:home_water_service_rider/utils/global_functions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../ui_widgets/OrderDetailWidgets/od_body.dart';
import '../../ui_widgets/OrderDetailWidgets/od_header.dart';
import 'package:http/http.dart' as http;

import '../../utils/shared_preference/SharePreferece.dart';
import '../../utils/urls.dart';

// typedef void openMapDirection(Orders orderHistoryModel);

class OrderDetail extends StatefulWidget {
  final String orderId;

  OrderDetail({super.key, required this.orderId});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Timer? timer;
  bool isLoading = false;
  String? driverId;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    timer = Timer.periodic(const Duration(seconds: 15),
        (Timer t) => _updateDriverLocation(driverId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          const OdHeader(),
          FutureBuilder(
            future: _getOrderDetail(widget.orderId),
            builder: (context, data) {
              if (data.connectionState == ConnectionState.waiting) {
                return Positioned(
                  top: 120,
                  child: Center(
                    child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                        child: const CircularProgressIndicator()),
                  ),
                );
              } else {
                if (data.data != null) {
                  driverId = data.data?.driverId;
                  return OdBody(context, data.data ?? Orders(),
                      openMapDirection, markAsComplete);
                } else {
                  return Positioned(
                    top: 120,
                    child: Container(
                      color: Colors.brown,
                    ),
                  );
                }
              }
            },
          )
          // OdBody(context, Fu, _openMapDirection)
        ]),
      ),
    );
  }

  Future<bool> markAsComplete(String id) async {
    try {
      setState(() {
        isLoading = true;
      });
      Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Authorization': token!
      };
      var request = http.put(Uri.parse(Url.updateOrder + id),
          body: jsonEncode(<String, String>{
            "status": "Completed",
          }),
          headers: headers);

      var response = await request;
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        print("Order Update${response.body}");
        SharedPreferencesManager.setOrderStatus("Completed");
        SharedPreferencesManager.setOrderId("");

        return true;
      } else {
        print("Order Update${response.body}");
        setState(() {
          isLoading = false;
        });
        return false;
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast('Error: $e');
      print(e);
      return false;
    }
  }

  Future<void> openMapDirection(Orders orderDetail) async {
    String appleUrl =
        'https://maps.apple.com/?saddr=&daddr=${orderDetail.lat},${orderDetail.long}&directionsmode=driving';
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${orderDetail.lat},${orderDetail.long}';

    Uri appleUri = Uri.parse(appleUrl);
    Uri googleUri = Uri.parse(googleUrl);

    if (Platform.isIOS) {
      if (await canLaunchUrl(appleUri)) {
        await launchUrl(appleUri, mode: LaunchMode.externalApplication);
      } else {
        if (await canLaunchUrl(googleUri)) {
          await launchUrl(googleUri, mode: LaunchMode.externalApplication);
        }
      }
    } else {
      if (Platform.isAndroid) {
        if (await canLaunchUrl(googleUri)) {
          await launchUrl(googleUri, mode: LaunchMode.externalApplication);
        }
      }
    }
  }

  Future<Orders?> _getOrderDetail(String id) async {
    try {
      Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Authorization': token!
      };

      var request =
          http.get(Uri.parse(Url.singleOrderDetail + id), headers: headers);

      var response = await request;
      if (response.statusCode == 200) {
        print(response.body);
        var product = SingleOrderResponse.fromJson(jsonDecode(response.body));
        return product.order;
      } else {
        return null;
      }
    } catch (e) {
      showToast('Error: $e');
      print(e);
      return null;
    }
  }

  Future<void> _updateDriverLocation(String? driverId) async {
    _getUserLocation(driverId);
  }

  Future<void> _getUserLocation(String? driverId) async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    var position = await GeolocatorPlatform.instance.getCurrentPosition();

    // toast("Lat:${position.latitude}, Long:${position.longitude}");
    try {
      Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Authorization': token!
      };

      var request = http.put(Uri.parse("${Url.updateDriver}$driverId"),
          body: jsonEncode(<String, String>{
            "lat": position.latitude.toString(),
            "long": position.longitude.toString(),
          }),
          headers: headers);

      var response = await request;
      if (response.statusCode == 200) {
        print("Driver Update${response.body}");
      } else {
        print("Driver Update${response.body}");
      }
    } catch (e) {
      print(e);
    }
  }
}
